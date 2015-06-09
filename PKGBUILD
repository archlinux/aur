# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-pdf-tools"
pkgver="0.7.1"
pkgrel="2"
pkgdesc="An extension for Nautilus to manipulate pdf files."
arch=('any')
url="http://www.atareao.es/tag/nautilus-document-converter/"
license=('GPL3')
depends=('python2-beautifulsoup4' 'python2-exiv2' 'python2-nautilus' 'python2-polib')
makedepends=('python2-distutils-extra')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/nautilus-extensions/+files/${pkgname}_${pkgver}-0extras14.04.0.tar.gz")
sha256sums=('8ae65655a24dbbaf1169d649323dc3c27cc2162245248b010952e48194a4da15')
install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}"
	sed -i "s|/usr/share/locale-langpack|/usr/share/locale|g" ./src/${pkgname}.py
	python2 setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	install -d ${pkgdir}/usr/share/locale
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "${pkgdir}"
	mv ./usr/share/locale-langpack/* ./usr/share/locale/
	rm -rf ./usr/share/locale-langpack
}

# vim:set ts=4 sw=2 ft=sh et:
