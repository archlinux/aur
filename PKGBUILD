# Maintainer: Anton Maminov <anton.maminov@gmail.com>

pkgname=apache-arrow-glib
pkgver=23.0.1
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
sha256sums=('85e6000264c5a74ff1079aa57c60949c5ee9235dc994fb5be5fb29055f3d6762')

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
