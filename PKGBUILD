# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=liblqr
pkgname=lib32-${_pkgname}
pkgver=0.4.2
pkgrel=1
pkgdesc="A seam-carving C/C++ library called Liquid Rescale (32-bit)"
arch=('x86_64')
url="http://liblqr.wikidot.com/"
license=('GPL')
depends=('lib32-glib2')
makedepends=('pkgconfig')
options=('!emptydirs')
source=("http://liblqr.wikidot.com/local--files/en:download-page/${_pkgname}-1-${pkgver}.tar.bz2")
md5sums=('915643d993da97e10665d48c0bf8f3d0')

build() {
  cd "${srcdir}/${_pkgname}-1-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgname}-1-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
}
