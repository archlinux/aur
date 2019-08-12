# Maintainer: Sebastian Wolf <fatmike303@gmail.com>
#
# This fixes the following issue:
# https://bugzilla.xfce.org/show_bug.cgi?id=9693

pkgname=xfce4-panel-borderfix
_pkgname=xfce4-panel
pkgver=4.14.0
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with a patch fixing border behavior using two monitors stacked on top each other"
arch=('x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('exo' 'garcon' 'libxfce4ui' 'xfconf' 'libwnck3' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'gobject-introspection' 'vala')
source=(
  https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
  'borderfix.patch'
)
sha256sums=(
  'd5f8f3bd7e142139987e5e62cda26135a424baabb5e47aa0c23b4169d0a66ef4'
  'effbe9c073f37987f877a168beddcfc03a38ec3adcba57a2cce3ce93b3420176'
)

prepare() {
  patch -d "$srcdir/$_pkgname-$pkgver" -p1 < borderfix.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
