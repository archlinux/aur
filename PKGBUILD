# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rewaita
pkgver=1.1.6
pkgrel=1
pkgdesc="A tool for recoloring GTK4/LibAdwaita apps to popular color schemes."
arch=('any')
url="https://github.com/SwordPuffin/Rewaita"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'python-fortune-python'
  'python-gobject'
  'python-numpy'
  'python-pillow'
  'python-pyciede2000'
  'xdg-desktop-portal-gtk'
)
makedepends=('meson')
optdepends=('adw-gtk-theme: GTK3 support')
source=("Rewaita-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c7d69bf4e135513420a6e850fda7c704456e4a9186bc6464866de70aa27f160')

build() {
  arch-meson "Rewaita-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
