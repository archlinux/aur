# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-isl
_pkgbasename=isl
pkgver=0.20
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('x86_64')
url="http://isl.gforge.inria.fr/"
depends=('lib32-gmp' 'lib32-glibc' 'isl')
makedepends=('lib32-gcc-libs')
license=('MIT')
source=("http://isl.gforge.inria.fr/${_pkgbasename}-${pkgver}.tar.xz")
sha256sums=('a5596a9fb8a5b365cb612e4b9628735d6e67e9178fae134a816ae195017e77aa')


prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}
