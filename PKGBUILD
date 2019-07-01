# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=libxfce4util
pkgname=${_pkgname}-devel
pkgver=4.13.4
pkgrel=1
pkgdesc="Basic utility non-GUI functions for Xfce"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('glib2')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'vala')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('57dd4ba226432afdf98cea4700a4679bb1b57ce80713167f99fde50ad87d0863')

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

