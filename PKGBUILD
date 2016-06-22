# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="movietitle"
pkgver="0.0.2.2"
pkgrel="3"
pkgdesc="An application to rename movie files."
arch=('any')
url="http://www.atareao.es/apps/limpiar-los-titulos-de-las-peliculas-en-ubuntu-con-movietitle/"
license=('GPL3')
depends=('python2-beautifulsoup4' 'python2-exiv2' 'python2-nautilus' 'python2-polib')
makedepends=('python2-distutils-extra')
provides=("${pkgname}")
source=("https://launchpad.net/~atareao/+archive/ubuntu/nautilus-extensions/+files/${pkgname}_${pkgver}-1ubuntu0.tar.xz")
sha256sums=('7595c0debc9f4731fc00fca66886b26f9a468094c8efa6ccfb8d94763a36ae4c')

build() {
	cd "${srcdir}/${pkgname}"
	sed -i "s|locale-langpack|locale|g" ./src/${pkgname}_extension.py
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
