# $Id$
# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_pkgname=geoip-gobject
pkgname=$_pkgname-git
pkgver=r1
pkgrel=2
pkgdesc="GObject wrapper for MaxMind's GeoIP C API"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('gobject-introspection' 'gtk-doc')
depends=('glib2' 'geoip')
url="https://github.com/skybon/geoip-gobject"
source=('git+https://github.com/skybon/geoip-gobject.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf --install
  ./configure --prefix=/usr --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
