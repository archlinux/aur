# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belr
pkgver=5.2.73
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox>=$pkgver")
makedepends=('cmake')
source=("belr-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belr/archive/$pkgver.tar.gz")
sha256sums=('5e9933c874dfb4a170295ddfc657b484d7dea5071e4be2fe5b8c51993bda2c51')

build() {
  cmake -B build $pkgname-$pkgver \
    -DCMAKE_PREFIX_PATH="/usr" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC=NO \
    -DENABLE_TOOLS=NO \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DENABLE_TESTS=NO \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
