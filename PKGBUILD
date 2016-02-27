# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_name=osm-gps-map
pkgname=$_name-git
pkgver=1.1.0.r7.gb7cc420
pkgrel=1
pkgdesc="Gtk+ widget for displaying OpenStreetMap tiles"
arch=(i686 x86_64)
url="http://nzjrs.github.io/$pkgname"
license=('GPL')
depends=('cairo' 'libsoup')
makedepends=('gnome-common' 'gtk-doc' 'gobject-introspection')
source=(git+https://github.com/nzjrs/${_name}.git)
md5sums=('SKIP')
provides=($_name)
conflicts=($_name)

pkgver() {
  cd $_name
  git describe --long | sed -r "s/^${_name}-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

build() {
  cd $srcdir/$_name
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --enable-gtk-doc
  make
}

package() {
  cd $srcdir/$_name
  make DESTDIR=$pkgdir install
}
