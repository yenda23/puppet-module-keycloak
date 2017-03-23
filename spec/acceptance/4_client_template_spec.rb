require 'spec_helper_acceptance'

describe 'keycloak::client-template define:' do
  context 'creates client-template' do
    it 'should run successfully' do
      pp =<<-EOS
      include mysql::server
      class { 'keycloak':
        datasource_driver => 'mysql',
      }
      keycloak::realm { 'test': }
      keycloak::client_template { 'openid-connect-clients':
        realm => 'test',
      }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  context 'updates client-template' do
    it 'should run successfully' do
      pp =<<-EOS
      include mysql::server
      class { 'keycloak':
        datasource_driver => 'mysql',
      }
      keycloak::realm { 'test': }
      keycloak::client_template { 'openid-connect-clients':
        realm => 'test',
        full_scope_allowed => false,
      }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
end
