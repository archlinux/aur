# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rewaita
pkgver=1.1.8
pkgrel=1
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
source=("Rewaita-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('73f133cb1f4c2a7b0e409f58ed33db5653bd56cfc3f924d3d8ea8deb87b3085e')

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
