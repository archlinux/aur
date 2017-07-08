# Maintainer: orumin <dev at orum.in>

pkgname=lib32-zvbi
_basename=zvbi
pkgver=0.2.35
pkgrel=1
pkgdesc="VBI capture and decoding library"
url="http://zapping.sourceforge.net/cgi-bin/view/ZVBI/WebHome"
arch=('x86_64')
depends=('lib32-libpng' 'lib32-libx11' 'zvbi')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/zapping/${_basename}-${pkgver}.tar.bz2)
md5sums=('95e53eb208c65ba6667fd4341455fa27')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_basename}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin \
  --build=i686-pc-linux-gnu --libdir=/usr/lib32
  make
}

package() {
  cd ${_basename}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}"/usr/include
  rm -r "${pkgdir}"/usr/share
}
