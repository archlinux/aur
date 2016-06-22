# $Id$
# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_pkgname=boinc-gobject
pkgname=$_pkgname-git
pkgver=r1
pkgrel=1
pkgdesc="GObject-based API for BOINC client"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('gobject-introspection' 'vala')
depends=('glib2' 'geoip')
url="https://github.com/skybon/boinc-gobject"
source=('git+https://github.com/skybon/boinc-gobject.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
