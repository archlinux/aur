# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=racon
pkgver=1.4.21
pkgrel=1
pkgdesc="Ultrafast consensus module for raw de novo genome assembly"
arch=('i686' 'x86_64')
url="https://github.com/lbcb-sci/racon"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake')
source=("https://github.com/lbcb-sci/racon/releases/download/$pkgver/racon-v$pkgver.tar.gz")
sha256sums=('df99208ebef6a12e1da11a31dade2eafe13a4cd80b4917cce44d44d879b5aee4')


build() {
  cd "$pkgname-v$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "$pkgname-v$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/racon"
}
