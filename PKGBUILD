# Maintainer: soloturn@gmail.com

pkgname=rust-brotli-git
pkgver=3.3.4.r5.ge216a8a
pkgrel=1
pkgdesc="brotli compressor, can append brotli files, rust."
arch=('aarch64' 'x86_64')
url="https://helix-editor.com"
license=('BSD')
makedepends=('cargo' 'git' 'rustup')
options=('!lto')
source=(
  "$pkgname::git+https://github.com/dropbox/rust-brotli.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$pkgname"
  #cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  #cargo build --frozen --release
  cargo build --release
}

check() {
  cd "$pkgname"
  #cargo test --frozen --all-features
  #cargo test --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "$srcdir/$pkgname/target/release/catbrotli" "$pkgdir/usr/bin/catbrotli-git"
  install -Dm755 "$srcdir/$pkgname/target/release/brotli" "$pkgdir/usr/bin/brotli-git"
}
