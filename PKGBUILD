# Maintainer: HLFH <gaspard@dhautefeuille.eu>
pkgname=dibbler-git
pkgver=1.0.1.r129.ga7c6cf58
pkgrel=1
pkgdesc="Dibbler, a portable DHCPv6"
arch=('i686' 'x86_64' 'armv7h')
url="http://klub.com.pl/dhcpv6/"
license=('GPL')
conflicts=('dibbler')
source=(git+https://github.com/tomaszmrugalski/dibbler
	'dibbler-client.service')
sha512sums=('SKIP'
	    'c8334be4ac1cf011b2727a72e0f35b12ce063ffd5e517182f5733b6a3d57cf406eed6436f6133b9b1bcd77792a44e6ee52c40b462c253bf1d245f0dbf9791ef3')

pkgver() {
  cd dibbler
  git describe --long --tags | sed 's/^RELEASE//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/dibbler
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  mkdir -p $pkgdir/var/lib/dibbler
  mkdir -p $pkgdir/etc/dibbler
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/dibbler-client.service $pkgdir/usr/lib/systemd/system
  cd $srcdir/dibbler
  make DESTDIR=$pkgdir/ install
}
