# Maintainer: Anton Maminov <anton.maminov@gmail.com>

pkgname=apache-arrow-glib
pkgver=23.0.0
pkgrel=1
pkgdesc="GLib bindings for Apache Arrow"
arch=('x86_64')
url="https://arrow.apache.org/"
license=('Apache-2.0')

depends=(arrow glib2 gobject-introspection)
makedepends=(cmake meson unzip)

provides=('arrow-c-glib')
conflicts=('arrow-c-glib')

source=("https://github.com/apache/arrow/archive/refs/tags/apache-arrow-${pkgver}.zip")
sha256sums=('ae0cb29bdb461fa39b77ef444ab7ba364cee208a6862cb2a7757614f3b9c8ee1')

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
