# Maintainer: Kelly Prescott <kprescott@coolip.net>

pkgname=onerng
pkgver=3.6
pkgrel=1
pkgdesc="driver for the OneRNG open hardware random number generator and entropy source"
arch=('any')
url="http://onerng.info"
license=('GPL3' 'LGPL3')
depends=('at'
	'rng-tools'
	'python-gnupg')
backup=('etc/onerng.conf')
install=onerng.install
source=(https://github.com/OneRNG/onerng.github.io/raw/master/sw/onerng_3.6.orig.tar.gz)
sha512sums=('d2f2bceb458e1441c4321526e5477ecb26df9f84e8554df723b97c3f09ad4c04149ac844bb88a182abf5350566cd5762c35137ba3c6b71685671a69ba12ccc58')
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
