# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emulsion-palette
pkgver=2.0.0
pkgrel=1
pkgdesc="Store your palettes in an easy way, and edit them if needed"
arch=('any')
url="https://github.com/lainsce/emulsion"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'json-glib' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a47368f5788b070569c540a6faba3c63254d6e155cac1bc2c727b0afcb3af3cc')

build() {
  arch-meson ${pkgname%-palette}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}
