# Maintainer: NBAFrigge
pkgname=wax-clipboard
pkgver=0.1.0
pkgrel=1
pkgdesc="Clipboard manager for Wayland / Hyprland"
arch=('x86_64')
url="https://github.com/NBAFrigge/wax"
license=('MIT')
depends=('wl-clipboard')
optdepends=('wofi: interactive picker'
  'rofi: interactive picker')
makedepends=('rust' 'cargo')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/wax-daemon" "$pkgdir/usr/bin/wax-daemon"
  install -Dm755 "target/release/wax-cli" "$pkgdir/usr/bin/wax"

  install -Dm644 "contrib/wax.service" \
    "$pkgdir/usr/lib/systemd/user/wax.service"
}
