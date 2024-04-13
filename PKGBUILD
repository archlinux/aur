# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=gtksheet
pkgver=4.3.13
pkgrel=1
pkgdesc="A spreadsheet widget for gtk3"
arch=(x86_64)
url=http://fpaquet.github.io/gtksheet/
license=('GPL2')
depends=(gtk3 pango cairo atk glade gobject-introspection)
makedepends=(autoconf)
source=(https://github.com/fpaquet/gtksheet/archive/V${pkgver}.tar.gz)
sha256sums=('48db0b057de1792c705f20a2c756d819d6e05e6e9e27304c5bab7126093729b3')

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
