# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=cppunit
pkgname=lib32-${_pkgname}
pkgver=1.14.0
pkgrel=1
pkgdesc="A C++ unit testing framework (32-bit)"
arch=('x86_64')
url="http://www.freedesktop.org/wiki/Software/cppunit"
license=('LGPL')
depends=("${_pkgname}" 'lib32-gcc-libs')
options=('!emptydirs')
source=(https://dev-www.libreoffice.org/src/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780')

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
  make -k check
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
