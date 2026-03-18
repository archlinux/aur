pkgname=niri_window_buttons
pkgver=0.4.0
pkgrel=1
pkgdesc="A Waybar module for displaying and managing traditional window buttons in the Niri compositor"
arch=('x86_64')
url="https://github.com/adelmonte/niri_window_buttons"
license=('GPL-3.0-or-later')
depends=('niri' 'waybar' 'gtk3' 'libpulse')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adelmonte/niri_window_buttons/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f70bd27f0ff6bd847d84469b0afa72e2020edb659819ea61bfc51961a24ade8')

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
