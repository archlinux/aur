# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard
pkgver=5.3.4
pkgrel=2
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("belr>=$pkgver" 'gcc-libs')
makedepends=('cmake')
source=("belcard-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belcard/archive/$pkgver.tar.gz")
sha256sums=('6c846b1c4be8a48e96a060f540e80551a2c678f2ecc1781384d3711ae8f2586f')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
      -DCMAKE_PREFIX_PATH="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DBUILD_SHARED_LIBS=YES \
      -DENABLE_UNIT_TESTS=NO
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
