# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=libidn2
pkgver=0.14
pkgrel=1
pkgdesc="A free software implementation of IDNA2008"
url="https://www.gnu.org/software/libidn/libidn2/manual/libidn2.html"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL3')
depends=('libunistring')
makedepends=('gtk-doc')
source=(http://alpha.gnu.org/gnu/libidn/${pkgname}-${pkgver}.tar.gz{,.sig})
sha1sums=('88524516b49f9736292ed4a7fa17a5be072ee64e'
          'SKIP')
validpgpkeys=('9AA9BDB11BB1B99A21285A330664A76954265E8C') # "Simon Josefsson <simon@josefsson.org>"

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --enable-gtk-doc
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}
package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/bin/idn2_noinstall
}
