# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=racon
pkgver=1.4.20
pkgrel=1
pkgdesc="Ultrafast consensus module for raw de novo genome assembly"
arch=('i686' 'x86_64')
url="https://github.com/lbcb-sci/racon"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake')
source=("https://github.com/lbcb-sci/racon/releases/download/$pkgver/racon-v$pkgver.tar.gz")
sha256sums=('820a2ef7a6edae624c8f2b2b8e22c5daace47af9dc91bb40ce6fe1f8169d299e')


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
