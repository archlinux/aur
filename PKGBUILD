# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-libmpc
_pkgbasename=libmpc
pkgver=1.1.0
pkgrel=1
pkgdesc="Library for the arithmetic of complex numbers with arbitrarily high precision"
arch=('x86_64')
url="http://www.multiprecision.org/"
depends=('lib32-gmp')
makedepends=('gcc-multilib')
license=('BSD')
source=("https://ftp.gnu.org/gnu/mpc/mpc-${pkgver/_/-}.tar.gz")
md5sums=('4125404e41e482ec68282a2e687f6c73')

prepare() {
  cd "${srcdir}/mpc-${pkgver}"
}

build() {
  cd "${srcdir}/mpc-${pkgver}"
  
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
  cd "${srcdir}/mpc-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}
