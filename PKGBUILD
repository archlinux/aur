# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasmer-git
pkgver=0.16.2.r84.g704c34283
pkgrel=1
pkgdesc="Standalone JIT WebAssembly runtime"
arch=('i686' 'x86_64')
url="https://wasmer.io/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cmake' 'python')
provides=('wasmer')
conflicts=('wasmer')
source=("git+https://github.com/wasmerio/wasmer.git")
sha256sums=('SKIP')


prepare() {
  cd "wasmer"

  git submodule update --init --recursive
}

pkgver() {
  cd "wasmer"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "wasmer"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "wasmer"

  cargo install \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/wasmer"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/wasmer"

  rm -f "$pkgdir/usr"/.crates*
}
