# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=gtksheet
pkgver=4.3.5
pkgrel=1
pkgdesc="A spreadsheet widget for gtk3"
arch=(x86_64)
url=http://fpaquet.github.io/gtksheet/
license=('GPL2')
depends=(gtk3 pango cairo atk glade gobject-introspection)
makedepends=(autoconf)
source=(https://github.com/fpaquet/gtksheet/archive/V${pkgver}.tar.gz)
sha256sums=('05671e656aee687294486d4041e2227fc971cd4fc7b43f6c1ca66a7c7b1ebf6d')

prepare() {
  cd gtksheet-${pkgver}
  autoreconf -i
  ./configure \
     --enable-glade \
     --enable-introspection \
     --prefix=/usr
}

build() {
  cd gtksheet-${pkgver}
  make
}

package() {
  cd gtksheet-${pkgver}
  make install "DESTDIR=/${pkgdir}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}

# vim:ts=2:sw=2:et:
