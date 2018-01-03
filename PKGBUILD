# Maintainer: orumin <dev at orum.in>

pkgname=lib32-libraw
_basename=libraw
pkgver=0.18.6
pkgrel=1
pkgdesc="A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others) (32-bit)"
arch=('x86_64')
url="http://www.libraw.org/"
license=(CDDL LGPL)
depends=(lib32-lcms2 lib32-jasper libraw)
source=("http://www.libraw.org/data/LibRaw-${pkgver}.tar.gz")
sha256sums=('e800d1dd7307b5d6dd638b0157a74e397a8a355153a1ce953a776ea78834df65')

build() {
  cd LibRaw-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --disable-examples
  make
}

package() {
  cd LibRaw-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/usr/include
  rm -rf "${pkgdir}"/usr/share
}
