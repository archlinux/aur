# $Id$
# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-appfinder
pkgname=${_pkgname}-gtk3
pkgver=4.12.0
pkgrel=1
pkgdesc="An application finder for Xfce (GTK3 version)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'garcon' 'hicolor-icon-theme')
makedepends=('intltool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
        0001-Use-non-legacy-icon-names.patch)
sha256sums=('2ad4a58019a76a6b64a816050db25f96854917c2f2e89d6a9df6c18e6c84c567'
            'b829103bf33d6f1ec71e1448e469b1b1df3313f887a27b7479a7cbc67e06643f')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  patch -Np1 -i ../0001-Use-non-legacy-icon-names.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-gtk3 \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
