pkgname=niri_window_buttons
pkgver=0.1.0
pkgrel=1
pkgdesc="A Waybar module for displaying and managing traditional window buttons in the Niri compositor"
arch=('x86_64')
url="https://github.com/adelmonte/niri_window_buttons"
license=('GPL-3.0-or-later')
depends=('niri' 'waybar' 'gtk3')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adelmonte/niri_window_buttons/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33b4ebd021275c8a34a0d05623a159a021e4c80478af29c2da3f999deec1c763')

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