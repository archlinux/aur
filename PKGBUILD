# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belr
pkgver=5.0.35
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox>=$pkgver")
makedepends=('cmake')
source=("belr-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belr/archive/$pkgver.tar.gz")
sha256sums=('7d72d5b0f7dea84b1ba64e5de1b7e6b1bdd99b367bc99d4eeb0e3d9e18926066')

build() {
  cmake -B build $pkgname-$pkgver \
    -DCMAKE_PREFIX_PATH="/usr" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC=NO \
    -DENABLE_TOOLS=NO \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
