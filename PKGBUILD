# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasmer-git
pkgver=3.0.0.alpha.r0.ge08b8fd67
pkgrel=1
pkgdesc="Standalone JIT WebAssembly runtime"
arch=('i686' 'x86_64')
url="https://wasmer.io/"
license=('MIT')
depends=('gcc-libs' 'libffi' 'ncurses' 'zlib')
makedepends=('git' 'cmake' 'llvm' 'rust')
provides=("wasmer=$pkgver")
conflicts=('wasmer')
options=('staticlibs')
source=("git+https://github.com/wasmerio/wasmer.git")
sha256sums=('SKIP')


pkgver() {
  cd "wasmer"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "wasmer"

  make \
    WASMER_INSTALL_PREFIX="/usr" \
    ENABLE_LLVM=1
}

check() {
  cd "wasmer"

  #make test
}

package() {
  cd "wasmer"

  make \
    DESTDIR="$pkgdir/usr" \
    install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/wasmer"
}
