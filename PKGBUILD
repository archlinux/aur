# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-isl
_pkgbasename=isl
pkgver=0.22.1
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('x86_64')
url="http://isl.gforge.inria.fr/"
depends=('lib32-gmp' 'isl')
makedepends=('gcc-multilib')
license=('MIT')
source=("http://isl.gforge.inria.fr/${_pkgbasename}-${pkgver}.tar.xz")
sha256sums=('28658ce0f0bdb95b51fd2eb15df24211c53284f6ca2ac5e897acc3169e55b60f')


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
