# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=libidn2
pkgver=2.0.4
pkgrel=1
pkgdesc="A free software implementation of IDNA2008"
url="https://www.gnu.org/software/libidn/libidn2/manual/libidn2.html"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL3')
depends=('libunistring')
makedepends=('gtk-doc' 'ruby-ronn')
source=(https://ftp.gnu.org/gnu/libidn/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('b00490f2251f218b130628eccacc170a4bb49db5'
          'SKIP')
validpgpkeys=('1CB27DBC98614B2D5841646D08302DB6A2670428') # "Simon Josefsson <simon@josefsson.org>"

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  # Docs disabled due to gtk-doc package removing gtkdoc-mktmpl function.
  # Fixing requires running gtkdocize + automake + autoconf
  # --enable-gtk-doc
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}
package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
