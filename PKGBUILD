# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rewaita
pkgver=1.1.8
pkgrel=2
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
source=("Rewaita-${pkgver}b.tar.gz::$url/archive/refs/tags/v${pkgver}b.tar.gz")
sha256sums=('9396c2ba169692e84cb8b9ff0721306bea03fe59a02307380b1b2597dc3f48ea')

build() {
  arch-meson "Rewaita-${pkgver}b" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
