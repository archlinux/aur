pkgname=nmrs
pkgver=1.1.0
pkgrel=2
pkgdesc="Wayland-native GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('cargo' 'git')

_pkgname=nmrs-gui

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/refs/tags/gui-v$pkgver.tar.gz"
  "nmrs.desktop"
)

sha256sums=('b8285bb1a62f218aea49965c5cdda71d25d319e43d5be29256ea14053fee5d12'
            '2279f157e299d52fabad1dfd9abd9e862b48dbba83921680f5134a537db061ef')

build() {
  cd "$srcdir/nmrs-gui-v$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/nmrs-gui-v$pkgver"
  install -Dm755 target/release/nmrs-gui "$pkgdir/usr/bin/nmrs"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/nmrs.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
