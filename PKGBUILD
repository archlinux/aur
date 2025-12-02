pkgname=niri_window_buttons-git
pkgver=0.2.0.r0.g36a8407
pkgrel=1
pkgdesc="A Waybar module for displaying and managing traditional window buttons in the Niri compositor (git version)"
arch=('x86_64')
url="https://github.com/adelmonte/niri_window_buttons"
license=('GPL-3.0-or-later')
depends=('niri' 'waybar' 'gtk3')
makedepends=('rust' 'cargo' 'git')
conflicts=('niri_window_buttons')
provides=('niri_window_buttons')
source=("git+https://github.com/adelmonte/niri_window_buttons.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/niri_window_buttons"
  printf "0.2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/niri_window_buttons"
  cargo build --release --locked
}

package() {
  cd "$srcdir/niri_window_buttons"
  install -Dm755 "target/release/libniri_window_buttons.so" "$pkgdir/usr/lib/waybar/libniri_window_buttons.so"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
