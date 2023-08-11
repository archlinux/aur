# Maintainer: Tal <talwat321@gmail.com>
pkgname=pokeget
pkgver=1.2.0
pkgrel=3
pkgdesc="Display pokemon sprites in your terminal."
arch=('x86_64')
url="https://github.com/talwat/pokeget-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('89116e69348deab8dd38b2676963e0d741561c263229cb2cc0a5199a5fc26aa04c3dc81a16faa8c9f219bffd39eb3b78e27a7f1ba6841e56e0db29d270b56132')

prepare() {
    cd "pokeget-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "pokeget-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "pokeget-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

