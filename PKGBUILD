# Maintainer: Saul Fautley <saulfautley@gmail.com>
pkgname=wctx
pkgver=1.0.1
pkgrel=1
pkgdesc="Real-time window context info for Wayland and X11"
arch=('x86_64')
url="https://github.com/slightlyfaulty/wctx"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slightlyfaulty/wctx/archive/v$pkgver.tar.gz")
sha256sums=('529d1aa87642e5f01a3c579e048111f5dceb13ff299b85707a6f4dcb90a8882b')

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
