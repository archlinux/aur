# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>

pkgname=freeimage
pkgver=3.16.0
pkgrel=1
pkgdesc="Library project for developers who would like to support popular graphics image formats"
arch=('i686' 'x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('gcc-libs')
makedepends=('dos2unix')
source=("http://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip")
md5sums=('1a2d1fff6204adbd479cc98818892fc1')

build() {
  cp -r FreeImage FreeImagefip

  cd FreeImage
  make

  cd ${srcdir}/FreeImagefip
  make -f Makefile.fip 
}

package() {
  cd FreeImage
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/FreeImagefip
  make -f Makefile.fip DESTDIR=${pkgdir} install

  install -D -m644 ${srcdir}/FreeImage/license-fi.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
