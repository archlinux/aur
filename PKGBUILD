# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=cargo-pgo
pkgver=0.2.4
pkgrel=1
pkgdesc="Cargo subcommand for optimizing Rust binaries with PGO and BOLT."
url="https://github.com/kobzol/cargo-pgo"
depends=('gcc-libs')
makedepends=('cargo')
arch=('x86_64')
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('102809849bdafceae2433544942a706328b383c796df89e2c3b9b50d532fde31cc384b126811338097569265d6607f4b5041ce0082867f5702f01d59beef5428')

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
