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
sha512sums=('46e6fc0feda8907cd0324c250d8cd8cb482a68cce62660b57c9559c5c27a8a440ff45dc08cb2917f52c22765b89cd1aeeafcc067fce488d2de81b83c0d5f2add')

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
