# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=toml-cli
pkgver=0.2.3
pkgrel=1
pkgdesc="CLI for editing and querying TOML files"
arch=("x86_64")
url='https://github.com/gnprice/toml-cli'
license=('MIT')
makedepends=("rust" "cargo")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('913f104612b0e549090e1cf77a7a49a12fa286af7e720dd46265bcc554b8f73a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/toml" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
