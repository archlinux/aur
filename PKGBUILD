# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rewaita
pkgver=1.1.8
pkgrel=3
pkgdesc="A tool for recoloring GTK4/LibAdwaita apps to popular color schemes."
arch=('any')
url="https://github.com/SwordPuffin/Rewaita"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'python-fortune-python'
  'python-gobject'
  'python-numpy'
  'python-pillow'
  'xdg-desktop-portal-gtk'
)
makedepends=('meson')
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("Rewaita-${pkgver}c.tar.gz::$url/archive/refs/tags/v${pkgver}c.tar.gz")
sha256sums=('d2b7bceec027548843c31bcf1eb6edc0167d8147d335498537872ac4546c0d71')

build() {
  arch-meson "Rewaita-${pkgver}c" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
