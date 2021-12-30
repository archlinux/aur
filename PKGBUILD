# Maintainer: Sematre <sematre at gmx dot de>
pkgname=edgeimpulse-cli
_pkgname=edge-impulse-cli
pkgver=1.14.0
pkgrel=1

pkgdesc="Command-line interface tools for Edge Impulse."
arch=('any')
url="https://github.com/edgeimpulse/edge-impulse-cli"
license=('Apache')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('9e1b534d18f02e8da765b729276e6e5858ad6ff007f1944b0cd2a6c6049e4723')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
	npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	# Extract the license
	tar xvf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${srcdir}" --strip-components 1 package/LICENSE
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
