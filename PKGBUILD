# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-lightning
pkgver=2.2.0
pkgrel=1
pkgdesc='Library that generates assembly language code at run-time (32-bit)'
arch=('x86_64')
url='https://www.gnu.org/software/lightning/'
license=('GPL')
depends=('lib32-zlib' 'lightning')
makedepends=('gcc-multilib')
source=("https://ftp.gnu.org/gnu/lightning/lightning-${pkgver}.tar.gz")
sha256sums=('4e3984ff1ccf0ba30a985211d40fc5c06b25f014ebdf3d80d0fe3d0c80dd7c0e')

build() {
  cd "${srcdir}/lightning-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/lightning-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
