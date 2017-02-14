# Maintainer: Andrew Stubbs <andrew.stubbs at gmail dot com>

pkgname=nuvola-app-youtube
pkgver=1.3
pkgrel=1
pkgdesc="Integration of YouTube into your linux desktop via Nuvola Player 3.0."
arch=('any')
url="https://github.com/tiliado/nuvola-app-youtube"
license=('2-Clause BSD-license')
depends=('nuvolaplayer>=3', 'nuvolaplayer<4')
makedepends=('lasem' 'scour' 'python-virtualenv')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tiliado/nuvola-app-youtube/archive/${pkgver}.tar.gz")
md5sums=('efc8d734e9cdb905ef9b275bcb17200e')

prepare() {
	cd "${pkgname}-${pkgver}"

	virtualenv ve
	source ve/bin/activate
	pip install nuvolasdk

	# Generate Makefile
	./configure --prefix=/usr
}

build() {
	cd "${pkgname}-${pkgver}"

	# Optimize SVG icons (scour), generate PNG icons (lasem)
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make install DESTDIR="${pkgdir}"

	# Install all available licenses.
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE*
}

# vim:set ts=4 sw=4 et:
