# Maintainer: Tal <talwat321@gmail.com>
pkgname=pokeget
pkgver=1.6.4
pkgrel=2
pkgdesc="Display pokemon sprites in your terminal."
arch=('any')
url="https://github.com/talwat/pokeget-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('31daa6054e07201ce70be5618c8e9f58a7c8bad61ec2b5e0b15c73621daadd5b23257bb5271eefa33a672165fc23a3cdef8c3213bbd6b0ef769554fb03ab4c3d')

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

