# Maintainer: Cosmic <CosmicHorrorDev@pm.me>

pkgname=metrics-observer
pkgver=0.4.0
pkgrel=1
pkgdesc='A text-based UI for observing metrics exported by the `metrics-exporter-tcp` Rust crate'
arch=(x86_64)
url="https://github.com/metrics-rs/metrics/metrics-observer"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('46a065ee76b8506b97fea281a37f93dbd10c6f71e91267fdbc0190f5d41f423aa6c965b0b9cd43c416adc427fb9b1fc01028a2efd7a6fb62bc6f4b01bc210952')

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
