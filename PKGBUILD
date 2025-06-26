# Maintainer: Bernardo Kuri <aur+rollup@bkuri.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=rollup
pkgver=4.44.1
pkgrel=1

arch=('any')
depends=('nodejs')
license=('MIT')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
options=('!emptydirs')
pkgdesc="Next-generation ES6 module bundler"
sha256sums=('20a63906ba831de394bbc6b588047e50d161360592da6237d576d63fd0576fce')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
url="https://rollupjs.org/"

package() {
	export NODE_ENV='production'
	npm install -g \
		--cache "${srcdir}/npm-cache" \
		--prefix "${pkgdir}/usr" \
		"${pkgname}-${pkgver}.tgz"

	chown -R root:root "${pkgdir}/"

	install -dv "${pkgdir}/usr/share/licenses/${pkgname}/" "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sv "/usr/lib/node_modules/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	ln -sv "/usr/lib/node_modules/${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
