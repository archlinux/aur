# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=jakartaee9-doc
pkgver=9.1.0
pkgrel=2
pkgdesc="Jakarta EE 9 documentation."
arch=('any')
url="https://github.com/eclipse-ee4j/jakartaee-api"
license=('EPL')
makedepends=('java-environment-openjdk=11' 'maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6e76bd0d9e895709977f058bf71beb355d5b117028b626e121db8793e3ed14ff')

build() {
    cd "jakartaee-api-${pkgver}"
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
    mvn -Pstaging install javadoc:javadoc
}

package() {
    cd "jakartaee-api-${pkgver}"
    install -d "${pkgdir}/usr/share/doc/${pkgname%-doc}/"
    cp -r "jakartaee-api/target/site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-doc}/api"
    cp -r "jakartaee-web-api/target/site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-doc}/web-api"
}
# vim:set ts=4 sw=4 et:
