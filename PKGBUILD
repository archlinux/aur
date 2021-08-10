# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos
pkgver=3.5.5
pkgrel=2
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('any')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('gtk4' 'json-glib' 'libadwaita' 'libhandy' 'libgee')
makedepends=('meson' 'gobject-introspection' 'ninja' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ed6023157516d2dbfe626b1a1e38d559ea032b0777b7da3de55a84538f3765a5')

check() {
  meson test -C build --print-errorlogs
}

build() {
  arch-meson ${pkgname%-git}-${pkgver} build
  meson compile -C build
}

package() {
  cd "$srcdir"
  DESTDIR="${pkgdir}" ninja -C build install
}
