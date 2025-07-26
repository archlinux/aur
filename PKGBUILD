# Maintainer: Tal <talwat321@gmail.com>
pkgname=pokeget
pkgver=1.6.5
pkgrel=2
pkgdesc="Display pokemon sprites in your terminal."
arch=('any')
url="https://github.com/talwat/pokeget-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('2413cbb56ff2acee8751e750d2af79071bfdfc9264799dee37b4b5166abf6e352c8410a75b51dd9f82d30c91bb3e7e4c25d0b16e872f8c28781ea030b1ea5a00')

prepare() {
    cd "pokeget-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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

