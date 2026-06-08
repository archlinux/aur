# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belr
pkgver=5.4.119
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox>=$pkgver")
makedepends=('cmake')
source=("belr-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belr/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f5ee859d058cf8b0953c6fd038c5033792866207a1cf8be27ca30aa7e716a3f6')

build() {
  cmake -B build $pkgname-$pkgver \
    -DCMAKE_PREFIX_PATH="/usr" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_SHARED_LIBS=YES \
    -DENABLE_TOOLS=NO \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DENABLE_UNIT_TESTS=NO \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
