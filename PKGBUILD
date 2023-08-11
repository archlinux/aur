# Maintainer: Tal <talwat321@gmail.com>
pkgname=pokeget
pkgver=1.2.0
pkgrel=1
pkgdesc="Display pokemon sprites in your terminal."
arch=('x86_64')
url="https://github.com/talwat/pokeget-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/talwat/pokeget-rs/archive/$pkgver.tar.gz")
sha512sums=('b7d067bd9f6ce53a581cad26a2bf012b4f258ebd409927a8a6a29180b7b917478277fc975bd453e4a9508844984d91eaabca82a63886a73043369714183a9a1c')

prepare() {
    cd "pokeget-rs-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "pokeget-rs-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "pokeget-rs-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

