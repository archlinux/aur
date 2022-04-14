# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=tokio-console
pkgver=0.1.4
pkgrel=1
pkgdesc="The Tokio console: a debugger for async Rust"
url="https://github.com/tokio-rs/console/tree/main/tokio-console"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tokio-rs/console/archive/refs/tags/tokio-console-v$pkgver.tar.gz")
sha256sums=('bb40511a49a1318e5f34aa82f717cd2f98ed2db88a773da50190bb6fa6867539')
b2sums=('4ec237e72e4054c7fcc3eea604f18dc78dbded7cf6e82694afd9603e21aba56fa3a4fb427a627c571f7d995b7fd046ebeda2c13836fc3e0625bd376413575cb6')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "console-tokio-console-v$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
