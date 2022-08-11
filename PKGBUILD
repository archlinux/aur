# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=tokio-console
pkgver=0.1.7
pkgrel=1
pkgdesc="The Tokio console: a debugger for async Rust"
url="https://github.com/tokio-rs/console/tree/main/tokio-console"
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tokio-rs/console/archive/refs/tags/tokio-console-v$pkgver.tar.gz")
sha256sums=('df3c9c4f7978ca7d66ccda3d464b73e2fa5d156ce4eda85703508ea50b77fb0c')
b2sums=('7e4cde2db89fd4b76b55b6ec7bbca813bea5334367b2d33d47e8e4d424599beb8309146678983df2d23411987c4e18bb945780cbf9edc76124e542ca5aaa3639')

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
