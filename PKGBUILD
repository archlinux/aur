# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
_libname=inetlib
pkgname=java-${_libname}
pkgver=1.1.2
pkgrel=4
pkgdesc="GNU Java library of clients for common internet protocols"
arch=('any')
url="https://www.gnu.org/software/classpath/inetlib.html"
license=('GPL')
depends=('java-runtime-headless')
makedepends=('java-environment')
source=(https://ftp.gnu.org/gnu/classpath/${_libname}-${pkgver}.tar.gz
        0001-make-logger-static-again.patch)
md5sums=('e28147996e70b63b6caa743319a4bf46'
         '9f231445d1f3307fb601f48d8ce25f7f')

build() {
  cd ${_libname}-${pkgver}

  patch -p1 < "${srcdir}"/0001-make-logger-static-again.patch

  ./configure
  make
}

package() {
  install -Dm644 ${_libname}-${pkgver}/${_libname}.jar \
                 "${pkgdir}"/usr/share/java/${_libname}-${pkgver}.jar

  ln -s ${_libname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${_libname}.jar
}
