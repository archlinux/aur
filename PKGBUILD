# Maintainer: Tal <talwat321@gmail.com>
pkgname=pokeget
pkgver=1.4.0
pkgrel=1
pkgdesc="Display pokemon sprites in your terminal."
arch=('any')
url="https://github.com/talwat/pokeget-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('9234df621caa9afc16e39c6aa377cedec8892d0b3764bac99eb675b998ee3767efc1ecbec428cca432cd6f2cc94ed4bc309e092147a5cd94c7e7821423b5d10b')

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

