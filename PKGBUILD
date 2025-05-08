# Maintainer: Cosmic <CosmicHorrorDev@pm.me>

pkgname=metrics-observer
pkgver=0.5.0
pkgrel=1
pkgdesc='A text-based UI for observing metrics exported by the `metrics-exporter-tcp` Rust crate'
arch=(x86_64)
url="https://github.com/metrics-rs/metrics/metrics-observer"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('0e863e00ca08472332b133863d0f56d731aedb011c2b98b7a9dbf4a787293414df8f0f8e772075ad6a530a04b3f708bb60aa66785a342c7baf5a1c3da4a4f5eb')

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
