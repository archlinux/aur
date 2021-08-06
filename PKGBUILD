# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos
pkgver=3.5.5
pkgrel=1
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('any')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('gtk4' 'json-glib' 'libadwaita' 'libhandy' 'libgee')
makedepends=('meson' 'gobject-introspection' 'ninja' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

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
