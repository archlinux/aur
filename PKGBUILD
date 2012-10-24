# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>

pkgname=freeimage
pkgver=3.15.3
pkgrel=2
pkgdesc='Library project for developers who would like to support popular graphics image formats'
arch=('i686' 'x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('gcc-libs')
makedepends=('hd2u')
source=("http://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip")
md5sums=('6c305b4086500ff8541c596ea6fc7cd7')

build() {
  cp -r FreeImage FreeImagefip

  export CFLAGS="$CFLAGS -fPIC -fexceptions -fvisibility=hidden -DNO_LCMS"
  export CXXFLAGS="$CXXFLAGS -fPIC -fexceptions -fvisibility=hidden -DNO_LCMS"

  cd FreeImage
  make

  cd ${srcdir}/FreeImagefip
  make -f Makefile.fip 
}

package() {
  cd FreeImage
  make DESTDIR=${pkgdir} install || true

  cd ${srcdir}/FreeImagefip
  make -f Makefile.fip DESTDIR=${pkgdir} install

  install -D -m644 ${srcdir}/FreeImage/license-fi.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
