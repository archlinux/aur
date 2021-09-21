# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos
pkgver=3.5.9
pkgrel=1
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('any')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('gtk4' 'json-glib' 'libadwaita' 'libhandy' 'libgee')
makedepends=('meson' 'gobject-introspection' 'ninja' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('8921bb2c476f8053222fc70f81c0265184f2d09796599d96a755d09279bea64ab4655a7db4bbde645236874f88ffa214cd87b237be7598ce7b8efe61e3a6ed2b')

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
