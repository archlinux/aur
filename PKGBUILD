# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
_libname=commons-net
pkgname=java-${_libname}1
pkgver=1.4.1
pkgrel=4
pkgdesc="Apache library that implements the client side of many basic Internet protocols"
arch=('any')
url="https://commons.apache.org/net/"
license=('APACHE')
depends=('java-runtime-headless')
makedepends=('apache-ant')
source=(https://archive.apache.org/dist/commons/net/source/${_libname}-${pkgver}-src.tar.gz{,.asc}
        https://archive.apache.org/dist/jakarta/oro/jakarta-oro-2.0.8.tar.gz)
sha512sums=('6ac697536eff947cd0aa828c887e9cc4046c49a593c760bbc59db7e04cf0d7456e84d22504cfa2f6915315dc061e3499382f05bd7740bf79a532a4d9d42c0da8'
            'SKIP'
            'a7f6eb6a088765f273df18ccc823f918737f18ec8772275054839a87f8370f1848e795d481f226c712651104d7598ab86c7d90a991fb039df6581f42f1447920')
validpgpkeys=('E0023F1748A80F02530C9046869D28BA47717B4B') # Steven M. Cohen <scohen@javactivity.org>

build() {
  cd ${_libname}-${pkgver}
  # "-Dbuild.sysclasspath=only" prevents ant from downloading oro
  ant \
    -lib "${srcdir}"/jakarta-oro-2.0.8/jakarta-oro-2.0.8.jar \
    -Dbuild.sysclasspath=only \
    jar
}

package() {
  cd ${_libname}-${pkgver}/target
  install -dm755 "${pkgdir}"/usr/share/java/${_libname}
  install -m644 ${_libname}-${pkgver}.jar "${pkgdir}"/usr/share/java
  ln -s ${_libname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${_libname}.jar
}
