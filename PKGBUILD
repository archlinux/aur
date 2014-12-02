# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Idares <idares at seznam dot cz>

pkgname=monitoring-plugins
pkgver=2.1.1
pkgrel=1
pkgdesc="Plugins for Icinga, Naemon, Nagios, Shinken, Sensu and other monitoring applications"
arch=('i686' 'x86_64')
url="http://www.monitoring-plugins.org"
license=('GPL3')
makedepends=('net-snmp' 'postgresql-libs' 'libdbi' 'libmariadbclient'
  'procps-ng' 'iputils' 'fping' 'dnsutils' 'rpcbind' 'smbclient' 'openssh'
  'inetutils' 'postfix' 'perl-net-snmp')
optdepends=('net-snmp: for SNMP checking'
  'postgresql-libs: for check_pgsql'
  'libmariadbclient: for check_mysql_query and check_mysql'
  'libdbi: for check_dbi'
  'libldap: for check_ldap')
provides=('nagios-plugins')
conflicts=('nagios-plugins')
replaces=('nagios-plugins')
source=(https://www.monitoring-plugins.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('8e564c03e3fc32f452956892b19abb4d')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 FAQ "$pkgdir"/usr/share/doc/$pkgname/FAQ
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 LEGAL "$pkgdir"/usr/share/licenses/$pkgname/LEGAL
}
