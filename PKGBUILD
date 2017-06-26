# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=libxfce4util
pkgname=${_pkgname}-devel
pkgver=4.13.1
pkgrel=1
pkgdesc="Basic utility non-GUI functions for Xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('glib2')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('278013dca14bfd50c9efd3898a28e3f3c5053b506de257267947fbb852d2ed2c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
