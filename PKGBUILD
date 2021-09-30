# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=khronos
pkgver=3.6.0
pkgrel=1
pkgdesc="Track each task's time in a simple inobtrusive way"
arch=('any')
url="https://github.com/lainsce/khronos"
license=('GPL3')
depends=('gtk4' 'json-glib' 'libadwaita-git' 'libgee')
makedepends=('meson' 'gobject-introspection' 'ninja' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('90e8c523061ab3fe00e9dd6c092067a8da3d6fc0976fc5d405875035139e03f12e0805b9ef8ac630e79eac30db462a910e14fbede0ee841f8696cc52e500f0dd')

build() {
  arch-meson ${pkgname%-git}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  cd "$srcdir"
  DESTDIR="${pkgdir}" ninja -C build install
}
