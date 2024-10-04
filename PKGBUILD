# Maintainer: Jose Maria Garcia <josemaria.alkala@gmail.com>
pkgname="arrow-c-glib"
pkgver=17.0.0
pkgrel=1
# epoch=
pkgdesc="Apache Arrow GLib is a wrapper library for Apache Arrow C++. Apache Arrow GLib provides C API."
arch=('x86_64')
source=(https://github.com/apache/arrow/archive/refs/tags/apache-arrow-${pkgver}.zip)
license=('Apache License 2.0')
# groups=()
depends=(arrow glib2 gobject-introspection)
makedepends=(git cmake meson)
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
#noextract=()
md5sums=('21a584f2f80fb54b39dc9ed4c0ffa956')
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