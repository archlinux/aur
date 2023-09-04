# Maintainer: Tal <talwat321@gmail.com>
pkgname=pokeget
pkgver=1.3.0
pkgrel=1
pkgdesc="Display pokemon sprites in your terminal."
arch=('any')
url="https://github.com/talwat/pokeget-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('0cffb839611a08061435d86f52cea77b18673f535b3fca6fc87b32b256de4e0bb4b0568fe0b2d047e20bea61516b3304001368bb58247caddfcf11e2e7c71ebf')

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

