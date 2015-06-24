# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=schroedinger
pkgname=lib32-${_pkgbase}
pkgver=1.0.11
pkgrel=1
pkgdesc="An implemenation of the Dirac video codec in ANSI C code (32 bit)"
arch=('x86_64')
url="http://www.diracvideo.org/"
license=('GPL2' 'LGPL2' 'MPL' 'MIT')
depends=('lib32-orc' 'lib32-gcc-libs' "${_pkgbase}")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://www.diracvideo.org/download/schroedinger/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('da6af08e564ca1157348fb8d92efc891')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32

  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  rm -rf "${pkgdir}"/usr/{include,share}
  mkdir -p "${pkgdir}/usr/share/licenses"
  ln -sf ${_pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}
