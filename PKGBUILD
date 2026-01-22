# Maintainer: Anton Maminov <anton.maminov@gmail.com>

pkgname=apache-arrow-glib
pkgver=22.0.0
pkgrel=2
pkgdesc="GLib bindings for Apache Arrow"
arch=('x86_64')
url="https://arrow.apache.org/"
license=('Apache-2.0')

depends=(arrow glib2 gobject-introspection)
makedepends=(cmake meson unzip)

provides=('arrow-c-glib')
conflicts=('arrow-c-glib')

source=("https://github.com/apache/arrow/archive/refs/tags/apache-arrow-${pkgver}.zip")
sha256sums=('9c854fa75c473c8c45b291031a7d16f13d4befcf93580450bdd66d7a675a4a5c')

prepare() {
  unzip -o "apache-arrow-${pkgver}.zip"
}

build() {
  cd "arrow-apache-arrow-${pkgver}"
  meson setup --prefix=/usr --buildtype=release c_glib.build c_glib
  meson compile -C c_glib.build
}

package() {
  cd "arrow-apache-arrow-${pkgver}"
  meson install -C c_glib.build --destdir "$pkgdir"
}
