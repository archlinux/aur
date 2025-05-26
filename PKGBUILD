# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=uwu_colors
pkgname=${_name/_/-}-git
pkgver=r32.12cc595
pkgrel=1
pkgdesc="a dead simple language server to colorize hex color strings via textDocument/documentColor"
arch=(aarch64 x86_64)
url="https://codeberg.org/q60/$_name"
license=(Unlicensed)
makedepends=(cargo git)
options=(!lto)
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_name" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$_name" || exit 1
  cargo build --locked --release
}

package() {
  cd "$srcdir/$_name" || exit 1
  install -Dm755 "target/release/$_name" -t "$pkgdir/usr/bin"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname}"
  install -Dm644 readme.md -t "$pkgdir/usr/share/doc/${pkgname}"
}
