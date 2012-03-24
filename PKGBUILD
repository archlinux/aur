# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=lio-snmp
_core_pkg=lio-utils
pkgver=4.1
pkgrel=1
epoch=
pkgdesc="snmp module for LIO Target and iSCSI"
arch=('i386' 'x86_64')
url="http://linux-iscsi.org/wiki/Lio-utils"
license=('GPL2')
depends=('net-snmp' 'lio-utils')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=lio-snmp.install
source=()
md5sums=()


build() {
  if [ ! -e "$_core_pkg-$pkgver.tgz" ]; then
    wget "http://www.risingtidesystems.com/git/?p=$_core_pkg.git;a=snapshot;h=595cd43e38ebd19813b91a3db35f3a707d2ba475;sf=tgz" -O "$_core_pkg-$pkgver.tgz"
  fi

  bsdtar -xf "$srcdir/$_core_pkg-$pkgver.tgz"

  cd "$srcdir/$_core_pkg/mib-modules"; make
}

package() {
  cd "$srcdir/$_core_pkg/mib-modules"
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/sbin"
  install -m 0755 setup_snmpd "$pkgdir/usr/sbin/lio_setup_snmpd"
}

# vim:set ts=2 sw=2 et:
