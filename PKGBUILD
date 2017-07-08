# Maintainer: orumin <dev at orum.in>

pkgname=lib32-vcdimager
_basename=vcdimager
pkgver=0.7.24
pkgrel=1
pkgdesc="A full-featured mastering suite for authoring disassembling and analyzing Video CD's and Super Video CD's (32-bit)"
arch=('x86_64')
url="http://www.vcdimager.org/"
license=('GPL')
depends=('lib32-libcdio' 'lib32-libxml2' 'lib32-popt' 'vcdimager')
source=(ftp://ftp.gnu.org/gnu/vcdimager/${_basename}-${pkgver}.tar.gz
        vcdimager-0.7.24-libcdio-0.83.patch)
md5sums=('3af22978fd79c79d5fda6513b6811145'
         'f4e7376fd9d975951d2b93a5e9123fdc')

prepare() {
  cd ${_basename}-${pkgver}
  patch -p1 -i "$srcdir/vcdimager-0.7.24-libcdio-0.83.patch"
}

build() {
  cd ${_basename}-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --build=i686-pc-linux-gnu --libdir=/usr/lib32 
  make
}

package() {
  cd ${_basename}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}"/usr/include
  rm -r "${pkgdir}"/usr/share
}
