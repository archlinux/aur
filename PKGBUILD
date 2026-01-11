# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=rewaita
pkgver=1.1.1
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
  'xdg-desktop-portal-gtk'
)
makedepends=('meson')
source=("Rewaita-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d775fecfae5f87546ffea68cdd71f6bb55ae08c7be9f5ec61e803ebae248c810')

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
