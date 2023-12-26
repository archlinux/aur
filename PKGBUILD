pkgname=java-commons-net
pkgver=3.10.0
pkgrel=1
pkgdesc="Apache library that implements the client side of many basic Internet protocols"
arch=('any')
url="https://commons.apache.org/net/"
license=('APACHE')
depends=('java-runtime>=8')
makedepends=('maven')
# https://dlcdn.apache.org//commons/net/source/commons-net-3.10.0-src.tar.gz
source=(https://dlcdn.apache.org//commons/net/source/commons-net-${pkgver}-src.tar.gz)
sha512sums=('d9d80255feddfb434d3baa629aa9e6d8feffd530c5e3172106fec55bbc986f6423a46dc9e737a1bb7020c62447229e6b83d0b7f9582d041e1def423536cc92dd')
# sha512sums=('6ac697536eff947cd0aa828c887e9cc4046c49a593c760bbc59db7e04cf0d7456e84d22504cfa2f6915315dc061e3499382f05bd7740bf79a532a4d9d42c0da8'
#            'SKIP'
#            'a7f6eb6a088765f273df18ccc823f918737f18ec8772275054839a87f8370f1848e795d481f226c712651104d7598ab86c7d90a991fb039df6581f42f1447920')
# validpgpkeys=('E0023F1748A80F02530C9046869D28BA47717B4B') # Steven M. Cohen <scohen@javactivity.org>

build() {
  cd "${srcdir}"/commons-net-${pkgver}-src
  # "-Dbuild.sysclasspath=only" prevents ant from downloading oro
  # ant \
    # -lib "${srcdir}"/jakarta-oro-2.0.8/jakarta-oro-2.0.8.jar \
    # -Dbuild.sysclasspath=only \
    # jar
  mvn install
}

package() {
  cd "${srcdir}"/commons-net-${pkgver}-src
  install -Dm644 target/commons-net-${pkgver}.jar "${pkgdir}"/usr/share/java/${pkgname}/commons-net-${pkgver}.jar
#  ln -s ${_libname}-${pkgver}.jar "${pkgdir}"/usr/share/java/${_libname}.jar
}
