# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belr
pkgver=4.4.0
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=('bctoolbox>=4.4')
makedepends=('cmake')
source=("belr-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belr/archive/$pkgver.tar.gz")
sha256sums=('0b6ab6d3c4d0eb07036e21d2a7e03d949230cc89fd70730d79e28292f02ff101')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_PREFIX_PATH="/usr" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO \
      -DENABLE_TOOLS=NO \
      -DCMAKE_SKIP_INSTALL_RPATH=ON "../$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
