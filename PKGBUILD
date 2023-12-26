pkgname=java-commons-math
pkgver=4.0_beta1
_pkmaior=4
pkgrel=1
pkgdesc='Apache Commons Mathematics Library'
arch=(any)
url='http://commons.apache.org/math/'
license=('APACHE')
depends=('java-runtime')
makedepends=('maven')
# https://dlcdn.apache.org//commons/math/source/commons-math4-4.0-beta1-src.tar.gz
source=("commons-math-${pkgver//_/-}-src.tar.gz::https://dlcdn.apache.org//commons/math/source/commons-math${_pkmaior}-${pkgver//_/-}-src.tar.gz")
sha512sums=('668f552c444c7328bfb4e73bfba031e00d56212fc38a5d587ac9809ae63547b1caec7edb46a808dd62054601aaca696c3afa9fc4b6e5daa38d8c0db0f31a2ccd')

build() {
    cd "${srcdir}/commons-math-${pkgver//_/-}-src"

    mvn install
}

package() {
    cd "${srcdir}/commons-math-${pkgver//_/-}-src"

    install -Dm644 "target/commons-math-${pkgver//_/-}.jar" "${pkgdir}/usr/share/java/${pkgname}/commons-math-${pkgver//_/-}.jar"
    install -Dm644 "target/commons-math-${pkgver//_/-}-tools.jar" "${pkgdir}/usr/share/java/${pkgname}/commons-math-${pkgver//_/-}-tools.jar"

    install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
# vim:set ts=2 sw=2 et:
