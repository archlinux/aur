# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=microprofile-docs
pkgver=6.0
pkgrel=1
pkgdesc="Eclipse MicroProfile project documentations."
arch=('any')
url="https://github.com/eclipse/microprofile"
license=('APACHE2')
makedepends=('java-environment-openjdk>=11' 'maven')
source=("${pkgname%-docs}-${pkgver//_/-}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('3bc082d81ea1c3850f07f8f2c3b5faa7c203de3731a279b7e1fb2d106d72522a')

build() {
    cd "${pkgname%-docs}-${pkgver//_/-}"
    #export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
    mvn -Pstaging install javadoc:javadoc
}

package() {
    cd "${pkgname%-docs}-${pkgver//_/-}/spec/target/"
    install -d "${pkgdir}/usr/share/doc/${pkgname%-docs}"
    cp -r generated-docs/* "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
    cp -r "site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-docs}/"
}
# vim:set ts=4 sw=4 et:
