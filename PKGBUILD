# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uthenticode
pkgver=2.0.1
pkgrel=1
pkgdesc="A cross-platform library for verifying Authenticode signatures"
arch=('i686' 'x86_64')
url="https://trailofbits.github.io/uthenticode/"
license=('MIT')
depends=('gcc-libs' 'openssl' 'pe-parse')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trailofbits/uthenticode/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('74cf6c428469ecd3eb05fab94f9a0d5e42b2cdab54894b33c940ef33d81dc2ad')


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
