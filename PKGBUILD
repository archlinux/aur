# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=osm-gps-map
pkgname=$_pkgname-git
pkgver=1.2.0.r36.g2396aa6
pkgrel=1
pkgdesc="Gtk+ widget for displaying OpenStreetMap tiles"
arch=(x86_64)
url="https://nzjrs.github.io/osm-gps-map/"
license=(GPL2)
depends=(gtk3 libsoup)
makedepends=(git gtk-doc gobject-introspection)
source=(git+https://github.com/nzjrs/${_pkgname}.git)
md5sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd $_pkgname
  git describe --tags --long | sed -r "s/^${_pkgname}-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

build() {
  cd $srcdir/$_pkgname
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-gtk-doc
  make
}

package() {
  cd $srcdir/$_pkgname
  make DESTDIR=$pkgdir install
}
