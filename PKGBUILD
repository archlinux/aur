# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
# XXX  Currently, it is assumed that the user intends to only
#      use snmptt in standalone-mode, meaning that it is not
#      intended to run as a daemon. As such, additional config
#      and example files have been omitted. Please check the
#      docs on what additional setup is needed.

pkgname=snmptt
pkgver=1.4.2
pkgrel=2
pkgdesc="A Perl-based SNMP trap handler for use with the Net-SNMP / UCD-SNMP snmptrapd program"
arch=('any')
url="http://snmptt.sourceforge.net/"
license=('GPL')
depends=('perl>=5.6.1' 'net-snmp' 'perl-config-inifiles')
optdepends=(
  'perl-dbd-mysql: To add support for MySQL database'
  'perl-dbd-pg: To add support for PostGres database'
  'perl-dbd-odbc: To add support for ODBC driver'
)
install="${pkgname}.install"
source=("https://sourceforge.net/projects/${pkgname}/files/snmptt/${pkgname}_${pkgver}/${pkgname}_${pkgver}.tgz")
md5sums=('4aba8b70bdd11e0cecca90fd9d979fd0')

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"

  # install binaries
  install -Dm755 snmptt "$pkgdir/usr/bin/snmptt"
  install -Dm755 snmpttconvert "$pkgdir/usr/bin/snmpttconvert"
  install -Dm755 snmpttconvertmib "$pkgdir/usr/bin/snmpttconvertmib"
  install -Dm755 snmptthandler "$pkgdir/usr/bin/snmptthandler"

  # install config
  install -d "$pkgdir/etc/snmp"
  install -Dm644 snmptt.ini "$pkgdir/etc/snmp/snmptt.ini"
  install -Dm644 examples/snmptt.conf.generic "$pkgdir/etc/snmp/snmptt.conf"

  # logrotation
  install -d "$pkgdir/etc/logrotate.d"
  install -Dm644 snmptt.logrotate "$pkgdir/etc/logrotate.d/snmptt"

  # install docs
  install -d "$pkgdir/usr/share/doc/snmptt"
  install -Dm644 README "$pkgdir/usr/share/doc/snmptt"
  cp -r docs "$pkgdir/usr/share/doc/snmptt"
  cp -r examples "$pkgdir/usr/share/doc/snmptt"
  cp -r contrib "$pkgdir/usr/share/doc/snmptt"
}

# vim:ts=2:sw=2
