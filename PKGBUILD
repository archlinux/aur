# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emulsion-palette
pkgver=3.2.0
pkgrel=1
pkgdesc="Store your palettes in an easy way, and edit them if needed"
arch=('x86_64')
url="https://github.com/lainsce/emulsion"
license=('GPL3')
depends=('glib2' 'gtk4' 'libadwaita' 'json-glib' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('e22af0da38ce6afbc92787f24ed0bbfa141c6e36a70595f431e0aaa65fce9e4f90299f2d7440c2bbf3319300f504f4114b4d6aa9146ba6ada9c079467cc628f1')

build() {
  arch-meson ${pkgname%-palette}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
