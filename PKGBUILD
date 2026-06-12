# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=wardrobe
pkgver=1.1.5
pkgrel=1
pkgdesc="Desktop customization utility"
arch=('any')
url="https://github.com/SwordPuffin/Wardrobe"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'gnome-autoar'
  'gtk4'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'libsoup3'
  'python-gobject'
  'xdg-utils'
)
makedepends=('meson')
source=("Wardrobe-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('121544cdb4b93987a565abd50c39fec3910020d6dd7ce39a6587462251eb76c4')

build() {
  arch-meson "Wardrobe-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
