# Maintainer Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>
pkgname=freeimage
pkgver=3.14.0
pkgrel=1
pkgdesc="Library project for developers who would like to support popular graphics image formats."
arch=('i686' 'x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('gcc-libs')
makedepends=('hd2u')
source=(http://downloads.sourceforge.net/sourceforge/freeimage/FreeImage3140.zip gcc4.5_ln.patch)
md5sums=('780f21d5eeea0c368eff2cc215e264ce'
         '16a79453aa54fae54245191afb1d2f69')

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
