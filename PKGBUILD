# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-nextest
pkgver=0.9.8
pkgrel=1
pkgdesc="A next-generation test runner for Rust."
url="https://github.com/nextest-rs/nextest"
license=('Apache' 'MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextest-rs/nextest/archive/refs/tags/cargo-nextest-$pkgver.tar.gz")
cksums=('2114248276')
sha256sums=('4af2b4c1e216dc87d1dfae4cbc1520379efd365ec014a55ceb313dcd5dee2a05')
b2sums=('808e62d1f02e82ac7ed2d25f9bba1c6b736da8179808e5e60dcedc33f45094b3af071f4ce5db63a2a41ef268a985b8356d99ea7a2c76ec199dc030791e8ec8a5')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "nextest-cargo-nextest-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "nextest-cargo-nextest-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release -p cargo-nextest
}

package() {
  cd "nextest-cargo-nextest-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/cargo-nextest

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE-{APACHE,MIT}
}
