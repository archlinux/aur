# Maintainer: ERSocalypse <ERSocalypse at gmail dot com>
pkgname=hypr-dock
pkgver=1.2.1
pkgrel=1
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
sha256sums=('a9090b5b616e348096e528637e616e1110ebf7764f20e3d03864bbf712e4b047')
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
