# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gjdoc
pkgver=0.7.9
pkgrel=3
pkgdesc="GNU Classpath JavaDoc implementation"
arch=(i686 x86_64)
license=('GPL')
url="http://savannah.gnu.org/projects/classpath/"
depends=('gcc-gcj>=4.9.2')
options=('!libtool' '!buildflags')
noextract=('antlr-2.7.7.jar')
source=(http://ftp.gnu.org/gnu/classpath/${pkgname}-${pkgver}.tar.gz
	http://www.antlr2.org/download/antlr-2.7.7.jar)
md5sums=('24cade2efe22d5adefcbabb21f094803'
         'f8f1352c52a4c6a500b597596501fc64')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-antlr-jar=${srcdir}/antlr-2.7.7.jar
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make GCJFLAGS='-g -O2 -fsource=1.3'
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR=${pkgdir} install
}
