# Maintainer: Carlo Abelli <carlo@abelli.me>

pkgname=sirula
pkgver=1.0.0
pkgrel=2
pkgdesc='An app launcher for wayland'
url='https://github.com/DorianRudolph/sirula'
arch=('x86_64')
license=('GPL3')
makedepends=('cargo')
depends=('gtk-layer-shell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DorianRudolph/sirula/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('311c2b3c1502a2e7c1c1ccd4c6a98f7fa387508cd2f3af23ea29b81f581292df')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
