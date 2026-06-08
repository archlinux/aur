# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lime
pkgver=5.4.119
pkgrel=1
pkgdesc="C++ library implementing Open Whisper System Signal protocol"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox>=$pkgver" 'soci>=4.0.0')
makedepends=('cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('602281774bc5d864fe86ca0fa05e0919430a04e7c8cb0aa72d676803a68fe114')

build() {
  cmake -B build $pkgname-$pkgver \
    -DCMAKE_PREFIX_PATH="/usr" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_SHARED_LIBS=YES \
    -DENABLE_UNIT_TESTS=NO \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized" \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
