# Maintainer: Kamil Śliwak <cameel2@gmail.com>
# Maintainer: Plaunarome <plaunarome@protonmail.com>

_name="multi-account-containers"
pkgname=firefox-extension-multi-account-containers
pkgver=7.3.0
pkgrel=2
pkgdesc="Keep parts of your online life separated into color-coded tabs"
arch=("any")
url="https://github.com/mozilla/${_name}"
license=("MPL2")
groups=("firefox-addons")
makedepends=("npm")
source=("${url}/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('4048a4fcf802ac2bffbd89f5fe3718ced81c2f666c05c5bf2e2839d7d63958b270fadfbe80753a84353385cc9c5435dbcaaed1e021fda18b2a15a95ee17e070f')

build() {
	cd "${_name}-${pkgver}"
	npm install --legacy-peer-deps

	cd src
	../node_modules/web-ext/bin/web-ext build --filename "${pkgname}.zip" --overwrite-dest
}

check() {
	cd "${_name}-${pkgver}"
	npm test
}

package() {
	install -D --mode 644 -- "${_name}-${pkgver}/src/web-ext-artifacts/${pkgname}.zip" \
		"${pkgdir}/usr/lib/firefox/browser/extensions/@testpilot-containers.xpi"
}
