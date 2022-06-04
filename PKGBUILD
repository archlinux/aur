# Maintainer: Kelly Prescott <kprescott@coolip.net>
# Contributor: Chris Kobayashi <software+aur@disavowed.jp>

pkgname=onerng
pkgver=3.7
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
source=(https://github.com/OneRNG/onerng.github.io/raw/master/sw/onerng_3.7.orig.tar.gz)
sha512sums=('6150787fc8415c7aaa13d6e98c3dc72e9160308eb912d97b7c9f59c6d4f5a9612917a7ff34084ba52a80e0aac6c65dd29653dd3bd211bd261fb89273f02be830')
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
