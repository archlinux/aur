# Maintainer: Cosmic <CosmicHorrorDev@pm.me>

pkgname=metrics-observer
pkgver=0.5.1
pkgrel=1
pkgdesc='A text-based UI for observing metrics exported by the `metrics-exporter-tcp` Rust crate'
arch=(x86_64)
url="https://github.com/metrics-rs/metrics/metrics-observer"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('0ddeb7003684e1853627f03b5be6b0eb5714ad71dcd0a0b28282e92d1e5adca9fc8344174aee9733de5f26f6d6a746dfef79829a4071f060b5cf5b868d795a7b')

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
