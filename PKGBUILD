# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uthenticode
pkgver=1.0.9
pkgrel=1
pkgdesc="A cross-platform library for verifying Authenticode signatures"
arch=('i686' 'x86_64')
url="https://trailofbits.github.io/uthenticode/"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trailofbits/uthenticode/archive/refs/tags/v1.0.9.tar.gz")
sha256sums=('8961cc9048251ff2aff4e2073dd8b81307025211931780880abc16b108c08335')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uthenticode"
}
