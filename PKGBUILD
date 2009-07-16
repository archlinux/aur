# Maintainer Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>
pkgname=freeimage
pkgver=3.12.0
pkgrel=2
pkgdesc="Library project for developers who would like to support popular graphics image formats."
arch=('i686' 'x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('gcc-libs')
makedepends=('hd2u')
source=(http://dfn.dl.sourceforge.net/sourceforge/freeimage/FreeImage3120.zip)
md5sums=('47b259102f776a4bcd7affc00942f3b4')

build() {
  cd ${srcdir}/FreeImage
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  make -f Makefile.fip || return 1
  make -f Makefile.fip DESTDIR=${pkgdir} install || return 1
  install -Dm644 $srcdir/FreeImage/license-fi.txt \
    $pkgdir/usr/share/licenses/$pkgname/license-fi.txt
}
