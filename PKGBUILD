# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uthenticode
pkgver=2.0.0
pkgrel=1
pkgdesc="A cross-platform library for verifying Authenticode signatures"
arch=('i686' 'x86_64')
url="https://trailofbits.github.io/uthenticode/"
license=('MIT')
depends=('gcc-libs' 'openssl' 'pe-parse')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trailofbits/uthenticode/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6750f2b065c2ed58cf089c776876a2cd2886e8adb626fd2d17da5050428bde2c')


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
