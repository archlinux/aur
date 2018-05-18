# Contributor: Sebastian Wolf <fatmike303@gmail.com>
#
# This fixes the following issue:
# https://bugzilla.xfce.org/show_bug.cgi?id=9693

pkgname=xfce4-panel-borderfix
_pkgname=xfce4-panel
pkgver=4.12.2
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with a patch fixing border behavior using two monitors stacked on top each other"
arch=('x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'gtk-doc')
source=(
  https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
  'borderfix.patch'
)
sha256sums=(
  '42058abb81b8f87691d3999627447de71c3285bcf055f308aab5cefab2de0ce9'
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
    --enable-gtk-doc \
    --enable-gtk3 \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
