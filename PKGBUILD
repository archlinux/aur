# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=jakartaee9-doc
pkgver=9.0.0
pkgrel=1
pkgdesc="Jakarta EE 9 documentation."
arch=('any')
url="https://github.com/eclipse-ee4j/jakartaee-api"
license=('EPL')
makedepends=('java-environment>=8' 'maven')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a89e42cdc806963a5b564d7230dabc35f819c5448a3fca7d27ffcf5cf45b3f45')

build() {
	cd "jakartaee-api-${pkgver}"
	mvn -Pstaging install javadoc:javadoc
}

package() {
	cd "jakartaee-api-${pkgver}"
	install -d "${pkgdir}/usr/share/doc/${pkgname%-doc}/"
	cp -a "jakartaee-api/target/site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-doc}/api"
	cp -a "jakartaee-web-api/target/site/apidocs" "${pkgdir}/usr/share/doc/${pkgname%-doc}/web-api"
}
# vim:set ts=4 sw=4:
