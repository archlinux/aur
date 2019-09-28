# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-osl
_pkgbasename=osl
pkgver=0.9.2
pkgrel=2
pkgdesc="OpenScop Library"
arch=('x86_64')
url="http://icps.u-strasbg.fr/people/bastoul/public_html/development/openscop/index.html"
depends=('lib32-gmp')
makedepends=('gcc-multilib')
license=('BSD')
source=("https://github.com/periscop/openscop/releases/download/${pkgver}/${_pkgbasename}-${pkgver}.tar.gz")
md5sums=('21b88885dd315da02b3b054c2ce1032e')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --with-gmp=system
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}
