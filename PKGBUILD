# Maintainer: ERSocalypse <ERSocalypse at gmail dot com>
pkgname=hypr-dock
pkgver=1.2.0
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
sha256sums=('7542e765b15e9a33e5b3ee626bd825bca6e7fb783bda367a942fdae54b733664')
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
