# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=cargo-pgo
pkgver=0.2.8
pkgrel=1
pkgdesc="Cargo subcommand for optimizing Rust binaries with PGO and BOLT."
url="https://github.com/kobzol/cargo-pgo"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('de3974e7e3ec4b1022137094c7bf3dfb1902b8eeaf1d84b3211bb770904423efe25896f2cbb589b10df652921010ab8b1e618c168f84d0bde438472ee8a14362')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
