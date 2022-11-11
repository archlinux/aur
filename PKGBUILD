# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=microprofile-docs
pkgver=6.0_RC3
pkgrel=1
pkgdesc="Eclipse MicroProfile project documentations."
arch=('any')
url="https://github.com/eclipse/microprofile"
license=('APACHE2')
makedepends=('java-environment-openjdk=8' 'maven')
source=("${pkgname%-docs}-${pkgver//_/-}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('e4ac84a37e2065c1230c94e43ea885fcb9c63cf83cfe90af15fff3e60333b2c6')

build() {
    cd "${pkgname%-docs}-${pkgver//_/-}"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
    mvn -Pstaging install javadoc:javadoc
}

package() {
    cd "${pkgname%-docs}-${pkgver//_/-}/spec/target/"
    install -d "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r generated-docs/* "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
    cp -r "site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
}
# vim:set ts=4 sw=4 et:
