# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=cppunit
pkgname=lib32-${_pkgname}
pkgver=1.15.1
pkgrel=1
pkgdesc="A C++ unit testing framework (32-bit)"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/cppunit"
license=('LGPL')
depends=("${_pkgname}" 'lib32-gcc-libs')
options=('!emptydirs')
source=(https://dev-www.libreoffice.org/src/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make -k check || true
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
