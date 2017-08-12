# Maintainer: Kelly Prescott <kprescott@coolip.net>

pkgname=onerng
pkgver=3.5
pkgrel=3
pkgdesc="driver for the OneRNG open hardware random number generator and entropy source"
arch=('any')
url="http://onerng.info"
license=('GPL3' 'LGPL3')
depends=('at'
	'rng-tools'
	'python-gnupg')
backup=('etc/onerng.conf')
install=onerng.install
source=(https://github.com/OneRNG/onerng.github.io/raw/master/sw/onerng_3.5.orig.tar.gz)
sha256sums=('afd6d0b64ad8e5557d10b497a9afb4ddeaf5e8d967069921941927f49b93fb16')
provides=('onerng')
conflicts=('onerng')

build() {
  cd $pkgname\_$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/sbin
  make
}

package() {
  cd $pkgname\_$pkgver
  make DESTDIR="$pkgdir" install
  mv $pkgdir/sbin $pkgdir/usr/bin
}
