# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=cargo-pgo
pkgver=0.3.0
pkgrel=2
pkgdesc="Cargo subcommand for optimizing Rust binaries with PGO and BOLT."
url="https://github.com/kobzol/cargo-pgo"
depends=('gcc-libs')
makedepends=('cargo')
arch=('aarch64' 'x86_64')
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('1926066db368caaff09d1756369aabbe53a97f26abf13ce6685c22c15963307ea874dada1883fa4ae8d6177eace5e7b2d3f877f9020f4c6db636bd4e71e35cfe')

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
