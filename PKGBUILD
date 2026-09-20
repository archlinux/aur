# Maintainer: rinwate
# Upstream: https://github.com/klirichek/zj-58
# This package tracks the maintained fork which includes fixes for
# modern CMake and GCC and a segfault fix; pinned to release tag 0.1.0.
# Formerly known as zj-58-cups.
pkgname=zj-58
pkgver=0.1.0
pkgrel=1
pkgdesc="CUPS filter for ESC/POS thermal receipt printers (Zjiang ZJ-58, Xprinter XP-58 and clones)"
arch=('x86_64' 'aarch64')
url="https://github.com/RinWate/zj-58"
license=('BSD')
depends=('cups')
makedepends=('cmake' 'git')
conflicts=('zj-58-git')
replaces=('zj-58-cups')
source=(
  "zj-58::git+https://github.com/RinWate/zj-58.git#commit=ae3091a1a1ac31760ad9860377ce79095a368646"
)
sha256sums=('SKIP')

build() {
  cd "$srcdir/zj-58"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/zj-58/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/zj-58/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
