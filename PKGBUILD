# Maintainer: Cosmic <CosmicHorrorDev@pm.me>

pkgname=metrics-observer
pkgver=0.3.0
pkgrel=1
pkgdesc='A text-based UI for observing metrics exported by the `metrics-exporter-tcp` Rust crate'
arch=(x86_64)
url="https://github.com/metrics-rs/metrics/metrics-observer"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('d10cc64098796e358d36181193b2c57080ebcf383635f88ae1d106815cc06849199f44a6da48d34211eb35aff5ce34f9d1372b73187103bffbbde742f3f00dbf')

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
