pkgname=nmrs
pkgver=1.6.0
_srcdir="nmrs-gui-nmrs-gui-v$pkgver"
pkgrel=1
pkgdesc="Wayland-native GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/networkmanager-rs/nmrs-gui"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('rust' 'git')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/networkmanager-rs/nmrs-gui/archive/refs/tags/nmrs-gui-v$pkgver.tar.gz"
  "nmrs.desktop"
)

sha256sums=('474cc1cd3ee9513fa9f02c6268217aea6331462326891b318e74040f0161e830'
            '2279f157e299d52fabad1dfd9abd9e862b48dbba83921680f5134a537db061ef')

build() {
  cd "$_srcdir"
  cargo build --release
}

package() {
  cd "$_srcdir"
  install -Dm755 target/release/nmrs-gui "$pkgdir/usr/bin/nmrs"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/nmrs.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
