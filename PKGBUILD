# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-nextest
pkgver=0.9.9
pkgrel=1
pkgdesc="A next-generation test runner for Rust."
url="https://github.com/nextest-rs/nextest"
license=('Apache' 'MIT')
arch=('x86_64' 'i686')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nextest-rs/nextest/archive/refs/tags/cargo-nextest-$pkgver.tar.gz")
cksums=('3840355168')
sha256sums=('5553550b8cf24668a809cee8812b01851ec3ae122390234c0f01993c8b6e54c2')
b2sums=('df4c9d63ba4f8f7816efc2b5ca784fe0a5b15f6f4b59627f44d49c9ec77aefd3bb34d857c734c57f73c7ea096b964b2e9d74d14203c6a4620513b72498bcf059')

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
