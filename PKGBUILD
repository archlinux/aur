# Maintainer: LJ <aur.lj at munally.com>

pkgname=crates-lsp-git
pkgver=0.4.3.r2.gd760064
pkgrel=1
pkgdesc="Language Server implementation for Cargo.toml"
arch=('x86_64')
url="https://github.com/MathiasPius/crates-lsp"
license=('MIT')
makedepends=('cargo')
source=("git+$url")
b2sums=('SKIP')
options=(!debug !lto)

pkgver() {
  cd "$srcdir/crates-lsp"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$srcdir/crates-lsp"
    cargo build --release
}

package() {
      install -Dm755 "$srcdir/crates-lsp/target/release/crates-lsp" "$pkgdir/usr/bin/crates-lsp"
}
