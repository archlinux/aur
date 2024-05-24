# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=cargo-chef
pkgver=0.1.67
pkgrel=1
pkgdesc='A cargo-subcommand to speed up Rust Docker builds using Docker layer caching'
arch=(x86_64)
url="https://github.com/LukeMathWalker/$pkgname"
license=(APACHE MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('8261eed489df606bd0657f0317c712e8f6914bd1d159d9f9f2ea6a7b9e45fb482b75a8a91c31150932e71662f01b9b7cc28a7c1b39d0c9faef4cbbea495f7f6f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
