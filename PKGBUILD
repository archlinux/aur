# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio
pkgver=24.7.5
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
makedepends=('ant' 'npm')
options=(!strip)
source=("drawio-${pkgver}.tar.gz::https://github.com/jgraph/drawio/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bc0aae1ef1bf9c7bad3ffb04ccebab5d9f93c0dfe7312cb097f9b95f8d9b8f4118726d5f989638d697cdb5ab988877b0fdaf33a904250a1d39cbd8a864a05782')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/etc/dependencies/"
	npm install
	cd "${srcdir}/${pkgname}-${pkgver}/etc/build/"
	ant all
}

package() {
	install -dm0755 "${pkgdir}/usr/share/webapps/drawio"
	cp -r ${srcdir}/${pkgname}-${pkgver}/src/main/webapp/* "${pkgdir}/usr/share/webapps/drawio/"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
