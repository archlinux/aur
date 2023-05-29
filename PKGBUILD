# shellcheck disable=2034,SC2164
# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>
pkgname=languagetool-rust
pkgver=2.1.2
pkgrel=1
pkgdesc="LanguageTool API in Rust"
arch=(any)
url="https://github.com/jeertmans/languagetool-rust"
makedepends=(rust)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
md5sums=("9c7ed71dcff25cf31baf7f9b89604ca0")

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features full
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/ltrs"
}
