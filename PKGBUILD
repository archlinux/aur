# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lime
pkgver=4.4.13
pkgrel=1
pkgdesc="C++ library implementing Open Whisper System Signal protocol"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox=$pkgver" 'soci>=4.0.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('fca4b32c82e9fa1c2001c9c3a550a1f690af8d1b944717a8b5b3838e8b88ee5f')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_PREFIX_PATH="/usr" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC="NO" \
      -DENABLE_UNIT_TESTS=NO "../$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
