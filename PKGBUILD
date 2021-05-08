# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
_libname=jsch
pkgname=java-${_libname}
pkgver=0.1.55
pkgrel=2
pkgdesc="A pure Java implementation of SSH2"
arch=('any')
url='http://www.jcraft.com/jsch/'
license=('BSD')
depends=('java-runtime-headless=8')
makedepends=('apache-ant' 'java-environment=8')
source=(https://downloads.sourceforge.net/project/${_libname}/${_libname}/${pkgver}/${_libname}-${pkgver}.zip)
sha512sums=('334b550594272fe179f13fb6bbfc0a353334586786db2b3279608b85cdab3dd604e6dd04aa2376b5532816d906133e636b5359dda36c449d90173be501c61418')

build() {
  cd "${srcdir}/${_libname}-${pkgver}"
  ant dist
}

package() {
  install -Dm644 "${srcdir}/${_libname}-${pkgver}/dist/lib/${_libname}-${pkgver}.jar" \
                 "${pkgdir}/usr/share/java/${_libname}-${pkgver}.jar"
  ln -s ${_libname}-${pkgver}.jar "${pkgdir}/usr/share/java/${_libname}.jar"
  install -Dm644 "${srcdir}/${_libname}-${pkgver}/LICENSE.txt" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
