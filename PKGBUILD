# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=tokio-console
pkgver=0.1.13
pkgrel=1
pkgdesc="The Tokio console: a debugger for async Rust"
url="https://github.com/tokio-rs/console/tree/main/tokio-console"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tokio-rs/console/archive/refs/tags/tokio-console-v$pkgver.tar.gz")
sha256sums=('562a45df9e4c2fafede3e265da7f96ba0f3f3891a3025be55ca064f2239a2203')
b2sums=('1a4cb6bcd53bf5ef1dcaaf8d1d0139c4034fa31a7b4d29c86567d9f9e03ed2a0335c4ec7b032fe7a7a53bd24845e5a6b387fd3397f7fcb232517b7f6618ae6bf')

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
