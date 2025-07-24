# Maintainer:  charlie5 on #ada @ libera irc

# Commented out lines are problematic and will be addressed in a future PKGBUILD release.

pkgname=kazakov_simple_components
pkgver=4.75
pkgrel=1
pkgdesc="A set of low-level Ada components by Dmitri Kazakov."
arch=(i686 x86_64)
url=http://www.dmitry-kazakov.de/ada/components.htm
license=(GPL2+)

depends=(unixodbc)
makedepends=(gprbuild)

source=(http://www.dmitry-kazakov.de/ada/components_4_75.tgz
        LICENSE)
sha256sums=(56826190048d63aed8126c3949ee76d282e792498ce86acbd58cac1778e4127d
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