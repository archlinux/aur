# Maintainer: Tal <talwat321@gmail.com>
pkgname=pokeget
pkgver=1.2.4
pkgrel=1
pkgdesc="Display pokemon sprites in your terminal."
arch=('x86_64')
url="https://github.com/talwat/pokeget-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('3ea79e226c28b58a60539dd49324d523d35f2d54f2a3cbee586bb849571111c12b61b1111084e9b0ae663074cfac177cc0d1196456d0e1a4f23a8b89093f3502')

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

