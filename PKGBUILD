# Maintainer: soloturn@gmail.com

pkgname=rust-brotli
pkgver=3.3.4
pkgrel=1
pkgdesc="brotli compressor, can append brotli files, rust."
arch=('aarch64' 'x86_64')
url="https://helix-editor.com"
license=('BSD')
# needs nightly at the moment, use rustup therefor
makedepends=('cargo' 'git' 'rustup')
options=('!lto')
source=(
  "$pkgname::https://github.com/dropbox/rust-brotli/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
  '96c985bd4ae135d88301e4cd8576c300301ea8b6fef19b9590014c5a0f6a7c9c'
)

prepare() {
  cd "$pkgname-$pkgver"
  #cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  #cargo build --frozen --release
  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"
  #cargo test --frozen --all-features
  #cargo test --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/catbrotli" "$pkgdir/usr/bin/catbrotli"
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/brotli" "$pkgdir/usr/bin/brotli"

  # TODO
}