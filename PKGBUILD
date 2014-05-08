# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gjdoc
pkgver=0.7.9
pkgrel=2
pkgdesc="GNU Classpath JavaDoc implementation"
arch=(i686 x86_64)
license=('GPL')
url="http://savannah.gnu.org/projects/classpath/"
depends=('gcc-gcj>=4.3.1')
options=('!libtool')
noextract=('antlr-2.7.5.jar')
source=(http://ftp.gnu.org/gnu/classpath/${pkgname}-${pkgver}.tar.gz
	http://www.antlr2.org/download/antlr-2.7.5.jar)
md5sums=('24cade2efe22d5adefcbabb21f094803'
         '6d57df718efd2a03981c309ce3330a1f')

build() {
  export -n CFLAGS
  export -n CXXFLAGS
  export -n LDFLAGS
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-antlr-jar=${srcdir}/antlr-2.7.5.jar || return 1
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || return 1
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
