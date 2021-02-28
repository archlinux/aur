pkgname="wasi-libc-git"
pkgver=r208.2b7e73a
pkgrel=1
pkgdesc="libc for WebAssembly programs built on top of WASI system calls (from git repo)"
arch=("x86_64")
license=('Apache')
depends=(llvm clang)
source=('git+https://github.com/WebAssembly/wasi-libc.git#branch=main')
md5sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git')
install=wasi-libc.install
options=('!strip' 'staticlibs')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make WASM_CC=clang
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install WASM_CC=clang INSTALL_DIR="$pkgdir"/opt/wasi-libc
}
