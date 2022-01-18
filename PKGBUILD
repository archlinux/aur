# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=microprofile-docs
pkgver=5.0
pkgrel=1
pkgdesc="Eclipse MicroProfile project documentations."
arch=('any')
url="https://github.com/eclipse/microprofile"
license=('APACHE2')
makedepends=('java-environment-openjdk=8' 'maven')
source=("${pkgname%-docs}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d5d6d07904b2585d47447d5f841aa055b7f80125e1734024601d944b2ebc6666')

build() {
    cd "${pkgname%-docs}-${pkgver}"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
    mvn -Pstaging install javadoc:javadoc
}

package() {
    cd "${pkgname%-docs}-${pkgver}/spec/target/"
    install -d "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r generated-docs/* "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
    cp -r "site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
}
# vim:set ts=4 sw=4 et:
