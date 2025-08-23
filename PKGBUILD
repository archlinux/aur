# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gabtag
pkgver=14
pkgrel=1
pkgdesc="A Gtk Linux application to handle audio tags"
arch=('any')
url="https://github.com/lachhebo/GabTag"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-cairo'
  'python-gobject'
  'python-musicbrainzngs'
  'python-mutagen'
  'python-pillow'
)
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fe29496aafd1a46a9c055689116dc2dcb7afdde6d011296c7670d2148d11a4ea')

prepare() {
  cd "GabTag-$pkgver"

  # Correct version in About dialog
  sed -i "s/version: '11'/version: '${pkgver}'/g" meson.build
}

build() {
  arch-meson "GabTag-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
