# Maintainer:  charlie5 on #ada @ libera irc

# Commented out lines are problematic and will be addressed in a future PKGBUILD release.

pkgname=kazakov_simple_components
pkgver=4.66
pkgrel=1
pkgdesc="A set of low-level Ada components by Dmitri Kazakov."
arch=('i686' 'x86_64')
url="http://www.dmitry-kazakov.de/ada/components.htm"
license=('GPL2+')

depends=(unixodbc)
makedepends=(gprbuild)

source=(http://www.dmitry-kazakov.de/ada/components_4_66.tgz
        LICENSE)
sha256sums=(1657ab4d57ae7b11fd567c1a1fc95368f91eaaf94967718bf4be1d22233fe4d2
            3718d08bc7d42a49e6ce06d6d942f4e310e0db3c4336de1c9fd91dc6c3711615)


build()
{
   cd "$srcdir"

   gprbuild -P strings_edit.gpr
   gprbuild -P tables.gpr
   gprbuild -P xpm/xpm_parser.gpr
   
   gprbuild -P odbc/odbc.gpr

   gprbuild -P components.gpr
   gprbuild -P components-sqlite.gpr
   gprbuild -P components-python.gpr
   gprbuild -P components-openssl.gpr
   gprbuild -P components-odbc.gpr
   gprbuild -P components-ntp.gpr
   gprbuild -P components-julia.gpr
   gprbuild -P components-json.gpr
   gprbuild -P components-gnutls.gpr
   
   #   gprbuild -P components-gnade.gpr

   gprbuild -P components-connections_server.gpr
   gprbuild -P components-connections_server-smtp.gpr
   gprbuild -P components-connections_server-secure.gpr
   gprbuild -P components-connections_server-openssl.gpr
   gprbuild -P components-connections_server-mqtt.gpr
   gprbuild -P components-connections_server-modbus.gpr
   gprbuild -P components-connections_server-ldap.gpr
   gprbuild -P components-connections_server-http_server.gpr
   gprbuild -P components-connections_server-http_server-sqlite_browser.gpr
   gprbuild -P components-connections_server-elv_max_cube.gpr
   
   #   gprbuild -P components-apq.gpr
}



check()
{
   gprbuild -P test_strings_edit/strings_edit-test.gpr
   
   pushd ./test_strings_edit
   ./test_base64
   ./test_chacha20
   ./test_dn
   ./test_iso_8601
   ./test_iso_8859_10
   ./test_iso_8859_2
   ./test_iso_8859_3
   ./test_iso_8859_4
   ./test_iso_8859_5
   ./test_iso_8859_6
   ./test_iso_8859_7
   ./test_iso_8859_8
   ./test_iso_8859_9
   ./test_itu_t61
   ./test_koi8
   ./test_macos_roman
   ./test_oid
   ./test_radix50
   ./test_strings_edit
   ./test_string_streams
   ./test_windows_1250
   ./test_windows_1251
   ./test_windows_1252
   ./test_windows_1253
   ./test_windows_1254
   ./test_windows_1255
   ./test_windows_1256
   ./test_windows_1257
   ./test_windows_1258
   popd
   
   
   gprbuild -P test_tables/tables-test.gpr
   ./test_tables/test_tables
   
   gprbuild -P test_components/components-test_sqlite_browser.gpr
#   sudo ./test_components/test_http_sqlite_browser

   gprbuild -P test_components/components-sqlite-sqlite_persistence_tests.gpr
   ./test_components/test_sqlite_persistence

   gprbuild -P test_components/components-sqlite-benchmark_tests.gpr
   ./test_components/test_sqlite_benchmark
   
   gprbuild -P test_components/components-odbc-odbc_persistence_tests.gpr
#   ./test_components/test_native_odbc_persistence

   gprbuild -P test_components/components-odbc-odbc_bindings_tests.gpr
#   ./test_components/test_odbc_bindings

   gprbuild -P test_components/components-ntp-test_ntp.gpr
   ./test_components/test_ntp
 
   gprbuild -P test_components/components-json-test_json.gpr
   ./test_components/test_json
    
   gprbuild -P test_components/components-connections_server-test_websockets_mqtt.gpr
#   ./test_components/test_websocket_duplex_server
#   ./test_components/test_websocket_server
 
   gprbuild -P test_components/components-connections_server-test_ldap_client.gpr
   ./test_components/test_ldap_client

   gprbuild -P test_components/components-connections_server-test_echo_server.gpr
#   ./test_components/test_echo_server
 
   gprbuild -P test_components/components-connections_server-test_echo_client_async.gpr
#   ./test_components/test_echo_client_async

   gprbuild -P test_components/components-connections_server-test_echo_client.gpr
   ./test_components/test_echo_client

   gprbuild -P test_components/components-connections_server-test_data_server.gpr
   ./test_components/test_data_server

   gprbuild -P test_components/components-connections_server-test_data_client.gpr
   ./test_components/test_data_client

   gprbuild -P test_components/components-connections_server-smtp-test_smtp.gpr
#   ./test_components/test_smtp_client

   gprbuild -P test_components/components-connections_server-mqtt-test_mqtt.gpr
#   ./test_components/test_mqtt_server

   gprbuild -P test_components/components-connections_server-modbus-test_modbus_client.gpr
   ./test_components/test_modbus_client

   gprbuild -P test_components/components-connections_server-http_server-test_http_server.gpr
#   ./test_components/test_http_server

   gprbuild -P test_components/components-connections_server-http_server-test_https_server.gpr
   ./test_components/test_https_server

   gprbuild -P test_components/components-connections_server-http_server-test_https_openssl_server.gpr
#   ./test_components/test_https_openssl_server

   gprbuild -P parser-examples/parsing-tree/test_ada_parser.gpr
   ./parser-examples/parsing-tree/test_ada_parser

   gprbuild -P parser-examples/operation-stacks/test_operation_stack.gpr
   ./parser-examples/operation-stacks/test_operation_stack

   gprbuild -P parser-examples/calculator/console_calculator.gpr
   echo "" | ./parser-examples/calculator/console_calculator
    
    
   ./test_components/test_https_openssl_json_client
   ./test_components/test_https_openssl_client
   ./test_components/test_https_client
#   ./test_components/test_infinity_server
#   ./test_components/test_http_continuous_server
   ./test_components/test_http_client
   ./test_components/test_mqtt_client
   ./test_components/test_mqtt_webserver
   
   
#   gprbuild -P test_components/components-tests.gpr
#   gprbuild -P test_components/components-python-test_python.gpr
#   gprbuild -P test_components/components-julia-test_julia.gpr
#   gprbuild -P test_components/components-gnade-odbc_persistence_tests.gpr

#   gprbuild -P test_components/components-connections_server-test_mqtt_serial.gpr

#   gprbuild -P test_components/components-connections_server-elv_max_cube-test_elv_max_cube_client.gpr
#   gprbuild -P test_components/components-apq-apq_persistence_tests.gpr
#   gprbuild -P python-examples/module/test_module.gpr
#   gprbuild -P python-examples/class/test_class.gpr

#   gprbuild -P julia-examples/hello-julia/hello_julia.gpr
#   gprbuild -P julia-examples/function-call/function_call.gpr
#   gprbuild -P julia-examples/array-1d/array_1d.gpr
#   gprbuild -P julia-examples/ada-wrapper/ada_wrapper.gpr
#   gprbuild -P julia-examples/ada-call/ada_call.gpr
}



install_gpr()
{
   gprinstall -p --prefix="$pkgdir/usr" --sources-subdir="include/kazakov" --lib-subdir="lib/kazakov"   -P "$1"
}



package()
{
   cd "$srcdir"

   install_gpr strings_edit.gpr
   install_gpr tables.gpr
   install_gpr xpm/xpm_parser.gpr
   
   #   gprinstall -p --prefix="$pkgdir/usr" -P odbc/odbc.gpr

   install_gpr components.gpr
   install_gpr components-sqlite.gpr
   install_gpr components-python.gpr
   install_gpr components-openssl.gpr
   install_gpr components-odbc.gpr
   install_gpr components-ntp.gpr
   install_gpr components-julia.gpr
   install_gpr components-json.gpr
   install_gpr components-gnutls.gpr
   
   #   gprbuild -P components-gnade.gpr

   install_gpr components-connections_server.gpr
   install_gpr components-connections_server-smtp.gpr
   install_gpr components-connections_server-secure.gpr
   install_gpr components-connections_server-openssl.gpr
   install_gpr components-connections_server-mqtt.gpr
   install_gpr components-connections_server-modbus.gpr
   install_gpr components-connections_server-ldap.gpr
   install_gpr components-connections_server-http_server.gpr
   install_gpr components-connections_server-http_server-sqlite_browser.gpr
   install_gpr components-connections_server-elv_max_cube.gpr

   #   gprbuild -P components-apq.gpr


   # Install the license.
   install -D -m644 \
      "LICENSE"     \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}