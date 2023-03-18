# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=zlib-ng
pkgver=2.0.7
pkgrel=1
pkgdesc="zlib replacement with optimizations for 'next generation' systems"
arch=('i686' 'x86_64')
url="https://github.com/zlib-ng/zlib-ng"
license=('custom:zlib')
depends=('glibc')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/zlib-ng/zlib-ng/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6c0853bb27738b811f2b4d4af095323c3d5ce36ceed6b50e5f773204fb8f7200')


build() {
  cd "$pkgname-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "$pkgname-$pkgver"

  make -C "_build" test
}

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/zlib-ng"
}
