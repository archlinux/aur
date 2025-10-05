# Maintainer: Musagy <diegomusagy@gmail.com>
pkgname=hypremoji
pkgver=1.0.3
pkgrel=1
pkgdesc="A modern emoji picker for Hyprland, written in Rust + GTK4"
arch=('x86_64')
url="https://github.com/Musagy/hypremoji"
license=('ISC')
depends=(
  'gtk4'
  'noto-fonts-emoji'
  'wl-clipboard'  # provides wl-copy, wl-paste
  'hyprland'      # needed for hyprctl
)
makedepends=('git' 'rust' 'cargo')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
provides=("$pkgname")
conflicts=("$pkgname")
options=(!debug)
install=$pkgname.install

prepare() {
  cd "$pkgname"
  echo "✓ Preparing build environment..."
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/hypremoji" "$pkgdir/usr/bin/hypremoji"

  install -d "$pkgdir/usr/share/hypremoji/assets"
  cp -r assets/* "$pkgdir/usr/share/hypremoji/assets/"

  install -Dm644 "config/hypremoji.conf" "$pkgdir/usr/share/hypremoji/hypremoji.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
