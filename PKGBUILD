pkgname=niri_window_buttons
pkgver=0.4.7
pkgrel=1
pkgdesc="A Waybar module for displaying and managing traditional window buttons in the Niri compositor"
arch=('x86_64')
url="https://github.com/adelmonte/niri_window_buttons"
license=('GPL-3.0-or-later')
depends=('niri' 'waybar' 'gtk3' 'libpulse')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adelmonte/niri_window_buttons/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1885c6b8a442a4e36496cf68425ac77360bde442ed09390640e5b3bdc8cf9245')

build() {
  cd "$srcdir/niri_window_buttons-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/niri_window_buttons-$pkgver"
  install -Dm755 "target/release/libniri_window_buttons.so" "$pkgdir/usr/lib/waybar/libniri_window_buttons.so"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
