# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-ppl
_pkgbasename=ppl
pkgver=1.2
pkgrel=2
pkgdesc="Parma Polyhedra Library"
arch=('x86_64')
url="http://icps.u-strasbg.fr/people/bastoul/public_html/development/openscop/index.html"
depends=('lib32-gmp')
makedepends=('gcc-multilib')
license=('BSD')
source=("https://www.bugseng.com/products/ppl/download/ftp/releases/${pkgver}/ppl-${pkgver}.tar.xz")
sha256sums=('691f0d5a4fb0e206f4e132fc9132c71d6e33cdda168470d40ac3cf62340e9a60')

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
    --with-gmp-include=/usr/lib32/gmp \
    --with-gmp-lib=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}
