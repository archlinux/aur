# Maintainer: ERSocalypse <ERSocalypse at gmail dot com>
pkgname=hypr-dock
pkgver=1.1.1
pkgrel=2
options=('!debug')
pkgdesc="Interactive Dock Panel for Hyprland"
arch=('x86_64')
url="https://github.com/lotos-linux/hypr-dock"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell')
makedepends=('go' 'git' 'make')
provides=('hypr-dock')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/lotos-linux/hypr-dock/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7135f743f804c0747928dd0204c3663ecd0e20c1aa8f187b8fa69096417d337d')
install="${pkgname}.install"

build() {
  cd "$srcdir/hypr-dock-$pkgver"
  make get
  make build
}

package() {
  cd "$srcdir/hypr-dock-$pkgver"
  install -Dm755 "bin/hypr-dock" "$pkgdir/usr/bin/hypr-dock"

  # package configs so .install script can access them later
  install -d "$pkgdir/usr/share/$pkgname/configs"
  cp -r configs/* "$pkgdir/usr/share/$pkgname/configs/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
