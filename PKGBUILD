# Maintainer: mryll <https://github.com/mryll>
pkgname=waynote
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland-native markdown sticky notes for tiling WMs (wlr-layer-shell)"
arch=('x86_64')
url="https://github.com/mryll/waynote"
license=('MIT')
options=(!debug)
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e41ae90c8181355a47c67caba8de9b074b339e0ef9d84a9f0b7075c40f7c086')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "assets/waynote.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/waynote.svg"
  install -Dm644 "packaging/waynote.desktop" \
    "$pkgdir/usr/share/applications/waynote.desktop"
  install -Dm644 "packaging/waynote.service" \
    "$pkgdir/usr/lib/systemd/user/waynote.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
