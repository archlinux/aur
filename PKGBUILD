# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rewaita
pkgver=1.0.8
pkgrel=3
pkgdesc="A tool for recoloring GTK4/LibAdwaita apps to popular color schemes."
arch=('any')
url="https://github.com/SwordPuffin/Rewaita"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'libportal'
  'python-gobject'
  'xdg-desktop-portal-gtk'
)
makedepends=('meson')
source=("Rewaita-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9794e747a658a90bdd3370b3db09f4f7458cbf349cf2d6439f14e13dc4c0fc19')

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
