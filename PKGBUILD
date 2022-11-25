# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lime
pkgver=5.0.71
pkgrel=1
pkgdesc="C++ library implementing Open Whisper System Signal protocol"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox>=$pkgver" 'soci>=4.0.0')
makedepends=('cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('502890ff6bd736252c63c35e440971b584b2e315bf1928dc6e0d372efe8a7b36')

build() {
  cmake -B build $pkgname-$pkgver \
    -DCMAKE_PREFIX_PATH="/usr" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC="NO" \
    -DENABLE_UNIT_TESTS=NO \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized" \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
