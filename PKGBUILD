# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-lightning
pkgver=2.1.3
pkgrel=1
pkgdesc='Library that generates assembly language code at run-time (32-bit)'
arch=('x86_64')
url='https://www.gnu.org/software/lightning/'
license=('GPL')
depends=('lib32-zlib' 'lightning')
makedepends=('gcc-multilib')
source=("https://ftp.gnu.org/gnu/lightning/lightning-${pkgver}.tar.gz")
sha256sums=('ed856b866dc6f68678dc1151579118fab1c65fad687cf847fc2d94ca045efdc9')

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
