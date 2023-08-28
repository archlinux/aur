# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=tokio-console
pkgver=0.1.9
pkgrel=1
pkgdesc="The Tokio console: a debugger for async Rust"
url="https://github.com/tokio-rs/console/tree/main/tokio-console"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tokio-rs/console/archive/refs/tags/tokio-console-v$pkgver.tar.gz")
sha256sums=('6374620b214751723f925f1a2d9fb00b9687fde9f82f8ddf7086e2a49a51b1e7')
b2sums=('044a12d6c0da05b179d2c4203593b0f96f10e0cf1cf1a24f411c43f75f2b4380b933faba5a6c72b109dd1cfe5e3be9e338cf58bee3cccb3aca89798a11109f82')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "console-tokio-console-v$pkgver"

  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "console-tokio-console-v$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --bin tokio-console
}

package() {
  cd "console-tokio-console-v$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/tokio-console

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
