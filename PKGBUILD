# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=tokio-console
pkgver=0.1.12
pkgrel=1
pkgdesc="The Tokio console: a debugger for async Rust"
url="https://github.com/tokio-rs/console/tree/main/tokio-console"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tokio-rs/console/archive/refs/tags/tokio-console-v$pkgver.tar.gz")
sha256sums=('5613a9ada5ee1b2a66a9c2445973cc926e61962b4d31d1e05cc2b92e6d45953e')
b2sums=('b8228630675acb9e9e0abeb666112d465699f08b80b674952c526ae4e71f8705e9a211b16e757cc976e08112ebb73d7b878d9ccda93c9755a898a16ae66ddf73')

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
