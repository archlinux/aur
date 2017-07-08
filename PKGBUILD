# Maintainer: orumin <dev at orum.in>

pkgname=lib32-openexr
_basename=openexr
pkgver=2.2.0
pkgrel=1
pkgdesc="An high dynamic-range image file format library"
url="http://www.openexr.com/"
arch=('x86_64')
license=('BSD')
depends=('lib32-zlib' 'lib32-ilmbase' 'openexr')
source=("http://download.savannah.nongnu.org/releases/${_basename}/${_basename}-${pkgver}.tar.gz")

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_basename}-${pkgver}"
  ./configure --prefix=/usr --build=i686-pc-linux-gnu --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}"/usr/include
  rm -r "${pkgdir}"/usr/share
}
md5sums=('b64e931c82aa3790329c21418373db4e')
