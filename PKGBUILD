# Maintainer: Saul Fautley <saulfautley@gmail.com>
pkgname=wctx
pkgver=1.0.2
pkgrel=1
pkgdesc="Real-time window context info for Wayland and X11"
arch=('x86_64')
url="https://github.com/slightlyfaulty/wctx"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slightlyfaulty/wctx/archive/v$pkgver.tar.gz")
sha256sums=('580df72ef0ae0f06b98622a4d5cffbc629ce64205432cc561417b45b2357b2eb')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "wctx.service" "$pkgdir/usr/lib/systemd/user/wctx.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
