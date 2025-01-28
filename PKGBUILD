# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=cargo-pgo
pkgver=0.2.9
pkgrel=1
pkgdesc="Cargo subcommand for optimizing Rust binaries with PGO and BOLT."
url="https://github.com/kobzol/cargo-pgo"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('ea28b30988d642ccb7baacd0fead57236d7355729b8699a3f4544617421c9cf022381ba2f55e0f4becbbd8c1e93c2fa1425a1dd1a61e7ab06a6dce3c4992143f')

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
