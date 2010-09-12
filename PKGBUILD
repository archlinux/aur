# Maintainer Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>
pkgname=freeimage
pkgver=3.14.1
pkgrel=2
pkgdesc="Library project for developers who would like to support popular graphics image formats."
arch=('i686' 'x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('gcc-libs')
makedepends=('hd2u')
source=(http://downloads.sourceforge.net/sourceforge/freeimage/FreeImage3141.zip gcc4.5_ln.patch)
md5sums=('4b43112aa199d8a439e0535b9c25d8a4'
         'f85279b2572a0a9e03775909cd9cd759')

build() {
  cd ${srcdir}/FreeImage
  patch -p1 < $srcdir/gcc4.5_ln.patch
  make
  make DESTDIR=${pkgdir} install 
  make clean
  make -f Makefile.fip 
  make -f Makefile.fip DESTDIR=${pkgdir} install
  install -Dm644 $srcdir/FreeImage/license-fi.txt \
    $pkgdir/usr/share/licenses/$pkgname/license-fi.txt
  cd $pkgdir/usr/lib
  ln -s libfreeimage-$pkgver.so libfreeimage.so
  ln -s libfreeimageplus-$pkgver.so libfreeimageplus.so
}
