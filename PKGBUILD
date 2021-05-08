# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
_libname=gnumail
pkgname=java-${_libname}
pkgver=1.1.2
pkgrel=4
pkgdesc="GNU implementation of the JavaMail API specification, version 1.3"
arch=('any')
url="https://www.gnu.org/s/classpathx/javamail/javamail.html"
license=('GPL')
depends=('java-runtime-headless')
makedepends=('apache-ant' 'java-activation-gnu' 'java-inetlib')
source=(https://ftp.gnu.org/gnu/classpathx/mail-${pkgver}.tar.gz{,.sig})
sha512sums=('e6ce18a9310f1d89b971bd0403fa6ba1e88f3c8f605a7d093732134b63f98cfd61346b5ccb4aeaa0e9a852919de96733dc0e8a7dd5f652c4105c194c8ca80e46'
            'SKIP')
validpgpkeys=('2875BCCCAE65860C6087CA8FE9D9750C4A8782B8') # Chris Burdess <dog@bluezoo.org>

build() {
  cd mail-${pkgver}

  ant \
    -lib /usr/share/java/inetlib.jar \
    dist
}

package() {
  cd mail-${pkgver}

  install -dm755 "${pkgdir}"/usr/share/java/${_libname}
  for j in gnumail gnumail-providers; do
    install -m644 ${j}.jar "${pkgdir}"/usr/share/java/${_libname}/${j}-${pkgver}.jar
    ln -s ${_libname}/${j}-${pkgver}.jar "${pkgdir}"/usr/share/java/${j}.jar
  done
}
