# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=racon
pkgver=1.5.0
pkgrel=1
pkgdesc="Ultrafast consensus module for raw de novo genome assembly"
arch=('i686' 'x86_64')
url="https://github.com/lbcb-sci/racon"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/lbcb-sci/racon/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('41e362f71cc03b934f17d6e2c0d626e1b2997258261b14551586de006666424a')


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

package() {
  cd "$pkgname-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/racon"
}
