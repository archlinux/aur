# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=jakartaee10-doc
pkgver=10.0.0
pkgrel=1
pkgdesc="Jakarta EE 10 documentation."
arch=('any')
url="https://github.com/eclipse-ee4j/jakartaee-api"
license=('EPL')
makedepends=('java-environment-openjdk=11' 'maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('84468709f3514694ce4c9801e57252783862cfe2a47196f95bd6b517396e7cf6')

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
# vim:set ts=4 sw=4:
