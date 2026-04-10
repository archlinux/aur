pkgname=nmrs
pkgver=1.5.1
pkgrel=1
pkgdesc="Wayland-native GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('rust' 'git')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/refs/tags/gui-v$pkgver.tar.gz"
  "nmrs.desktop"
)

sha256sums=('732f78c979d4a8df5a95202496e346888d6951f77a274788e01f8c4c5199a094'
            '2279f157e299d52fabad1dfd9abd9e862b48dbba83921680f5134a537db061ef')

build() {
  cd "nmrs-gui-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "nmrs-gui-v$pkgver"
  install -Dm755 target/release/nmrs-gui "$pkgdir/usr/bin/nmrs"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "$srcdir/nmrs.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
