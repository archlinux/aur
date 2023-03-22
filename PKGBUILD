# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=zlib-ng-compat
pkgver=2.0.7
pkgrel=1
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
sha256sums=('6c0853bb27738b811f2b4d4af095323c3d5ce36ceed6b50e5f773204fb8f7200')


build() {
  cd "zlib-ng-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
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
