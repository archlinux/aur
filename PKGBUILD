# Maintainer: nemesys <nemstar AT zoho DOT com>

pkgname=svgalib
pkgver=1.9.27
pkgrel=1
pkgdesc="A low-level SuperVGA graphics library"
arch=('i686' 'x86_64')
url="http://www.svgalib.org/"
license=('GPL')
depends=('perl')
source=(https://github.com/akosela/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('8e39672cfe081062819a255e71ff03d6')

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p threeDKit

  find -name Makefile -exec sed '/fixldsoconf/d;/ldconfig/d' -i {} \;
  ln -sf ../gl/vgagl.h threeDKit/
  cd "${srcdir}"

  cd ${pkgname}-${pkgver}
  
  make prefix="${pkgdir}"/usr \
	NO_HELPER=n \
	shared static
}

package() {
  install -dm755 "${pkgdir}"/usr/lib
  
  cd ${pkgname}-${pkgver}
  
  make prefix="${pkgdir}"/usr \
	datadir="${pkgdir}"/etc/vga \
	NO_HELPER=y \
	install
}
