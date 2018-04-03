# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-lightning
pkgver=2.1.2
pkgrel=1
pkgdesc='Library that generates assembly language code at run-time'
arch=('x86_64')
url='https://www.gnu.org/software/lightning/'
license=('GPL')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-zlib' 'lightning')
source=("https://ftp.gnu.org/gnu/lightning/lightning-${pkgver}.tar.gz")
sha256sums=('9b289ed1c977602f9282da507db2e980dcfb5207ee8bd2501536a6852a157a69')

prepare() {
  cd "${srcdir}/lightning-${pkgver}"
  autoreconf -fvi
}

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
