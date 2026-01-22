# Maintainer: Anton maminov <anton.maminov@gmail.com>
pkgname="apache-arrow-glib"
pkgver=22.0.0
pkgrel=1
# epoch=
pkgdesc="GLib bindings for Apache Arrow"
arch=('x86_64')
source=(https://github.com/apache/arrow/archive/refs/tags/apache-arrow-${pkgver}.zip)
license=('Apache License 2.0')
# groups=()
depends=(arrow glib2 gobject-introspection)
makedepends=(git cmake meson)
provides=('arrow-c-glib')
# checkdepends=()
# optdepends=()
provides=('arrow-c-glib')
conflicts=('arrow-c-glib')
# replaces=()
# backup=()
# options=()
# install=
# changelog=
#noextract=()
md5sums=('87eed446b710f8dc1a70fdc4d76b7ac2')
#validpgpkeys=()

prepare() {
  unzip -o apache-arrow-${pkgver}.zip
}

build() {
	#cd "$pkgname"
  cd arrow-apache-arrow-${pkgver}
  meson setup --prefix=/usr --buildtype=release c_glib.build c_glib
  meson compile -C c_glib.build
}

package() {
  cd arrow-apache-arrow-${pkgver}
  meson install -C c_glib.build --destdir "$pkgdir"
}
