# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=jakartaee-api-docs-git
pkgver=8.0.0.r0.0104a7c
pkgrel=1
pkgdesc="Jakarta EE api documentations."
arch=('any')
url="https://github.com/eclipse-ee4j/jakartaee-api"
license=('EPL')
makedepends=('git' 'java-environment>=8' 'maven')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long $(git rev-list --tags --max-count=1) | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mvn -Pstaging install javadoc:javadoc
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "${pkgdir}/usr/share/doc/jakartaee/"
	cp -a "jakartaee-api/target/site/apidocs" "${pkgdir}/usr/share/doc/jakartaee/api"
    cp -a "jakartaee-web-api/target/site/apidocs" "${pkgdir}/usr/share/doc/jakartaee/web-api"
}
# vim:set ts=4 sw=4 et:
