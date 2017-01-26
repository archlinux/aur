# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=rest
pkgver=0.8.0
pkgrel=2
pkgdesc="Helper library for RESTful services"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Projects/Librest"
license=(LGPL2.1)
depends=(glib2 libxml2 libsoup)
makedepends=(gobject-introspection gtk-doc git glib2-docs)
_commit=47502e1f9444bef18e833c5f3a18e29a7945c0e8  # tags/0.8.0^0
source=("git+https://git.gnome.org/browse/librest#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd librest
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd librest
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd librest
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd librest
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
