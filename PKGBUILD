# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zlib-ng-compat
pkgver=2.1.2
pkgrel=2
pkgdesc="zlib replacement with optimizations for 'next generation' systems (replaces zlib)"
arch=('i686' 'x86_64')
url="https://github.com/zlib-ng/zlib-ng"
license=('custom:zlib')
depends=('glibc')
makedepends=('cmake')
provides=("zlib=1.2.11")
conflicts=('zlib')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/zlib-ng/zlib-ng/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('383560d6b00697c04e8878e26c0187b480971a8bce90ffd26a5a7b0f7ecf1a33')


build() {
  cd "zlib-ng-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DWITH_GTEST=OFF \
    -DZLIB_COMPAT=ON \
    ./
  make -C "_build"
}

check() {
  cd "zlib-ng-$pkgver"

  make -C "_build" test
}

package() {
  cd "zlib-ng-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/zlib-ng-compat"
}
