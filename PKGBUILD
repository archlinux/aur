# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

_pkgname=gd
pkgname=gd-headless
pkgver=2.2.3
pkgrel=1
pkgdesc="Library for the dynamic creation of images by programmers; built without xpm support"
arch=('i686' 'x86_64')
url="http://www.libgd.org/"
license=('custom')
depends=('fontconfig' 'libwebp')
optdepends=('perl: bdftogd script')
provides=('gd')
conflicts=('gd')
replaces=('gd')
source=("https://github.com/libgd/libgd/releases/download/gd-${pkgver}/libgd-${pkgver}.tar.xz")
sha1sums=('2f8cebec5afd6c83a3d5cb92f40ea4926b4daa98')

build() {
  cd libgd-${pkgver}
  ./configure \
    --prefix=/usr \
    --disable-rpath \
	--without-xpm
  make
}

#check() {
#  cd libgd-${pkgver}
#  [[ ${CARCH} == 'i686' ]] || make check
#}

package() {
  cd libgd-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
