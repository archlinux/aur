# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="nautilus-image-tools"
pkgver="0.0.2"
pkgrel="3"
pkgdesc="An extension for Nautilus to manipulate image files."
arch=('i686' 'x86_64')
url="http://www.atareao.es/tag/nautilus-image-tools/"
license=('GPL3')
depends=('python2-beautifulsoup4' 'python2-exiv2' 'python2-nautilus' 'python2-polib')
makedepends=('python2-distutils-extra')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/nautilus-extensions/+files/${pkgname}_${pkgver}-0extras14.04.0.tar.gz")
md5sums=('540958bceb343bb52008723e8a04af58')
install="${pkgname}.install"

build() {
	cd "${srcdir}/${pkgname}"
	sed -i "s|/usr/share/locale-langpack|/usr/share/locale|g" ./src/nautilus-image-tools.py
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
