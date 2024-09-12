# Maintainer: Tal <talwat321@gmail.com>
pkgname=pokeget
pkgver=1.6.2
pkgrel=1
pkgdesc="Display pokemon sprites in your terminal."
arch=('any')
url="https://github.com/talwat/pokeget-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('858d1efff4209b4881575fbaf0392694efa96df81c3f3cc8138cecf8718b6a23463f9542a5c89027367499e47297007f8617159f8c93f374fff4ea7fd04fdb54')

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

