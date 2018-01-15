# Maintainer: Jonathon Fernyhough <jonathon at_manjaro_org>

pkgname=swatchbooker
_pkgname=SwatchBooker
pkgver=0.7.6
pkgrel=1
pkgdesc='Colour swatch book viewer/convertor/editor'
arch=('any')
url='http://www.selapa.net/swatchbooker/'
license=('GPL3')
depends=('python2' 'python2-pyqt4')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/olivierberten/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8597f3a32d2da16aa79e9b3ebb64383aaba870a26acb11bf7ccae50923639848')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 ./setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 ./setup.py install -O2 --prefix="${pkgdir}"/usr

	# Tidy
	rm "${pkgdir}"/usr/bin/swatchbooker_w32_postinst.py

	# Fix up
	chmod a+x "${pkgdir}"/usr/bin/*
	for exe in "${pkgdir}"/usr/bin/*; do
		sed -i '4s|python|python2|' "$exe"
	done
}
