# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio
pkgver=24.7.8
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
makedepends=('ant' 'npm')
options=(!strip)
source=("drawio-${pkgver}.tar.gz::https://github.com/jgraph/drawio/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0b8e7e3c0c0bb2a7ba5ce07f64cf800c5deb73f7db69084e0929af667628171b78957b849a82420be256f4846080617a64e5fa1637bad574f0bde65777f11fc1')

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
