# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt-color-widgets-common
_pkgname=QtColorWidgets
pkgver=0.r183.467bda7
pkgrel=1
pkgdesc='Common files used by qt4- and qt5-color-widgets packages'
arch=('any')
url='https://github.com/mbasaglia/Qt-Color-Widgets'
license=('LGPL3')
makedepends=('git')
source=("${pkgname}::git+git://github.com/mbasaglia/Qt-Color-Widgets.git"
	'ColorDialog'
	'ColorPreview'
	'ColorWheel'
	'GradientSlider'
	'HueSlider')
sha256sums=('SKIP'
	'04dc1ca12e261b3a357a58d85cf95f0b8371bb8a6c5487a3048cdfffc434dfc1'
	'f2122b1a9d359c1545bf207684c7fb4d126c864c60df15cf19257ca83773f954'
	'0ac2d4f596c45a43c77c1f6bf2e8a107124b7b25b9a9a9bc3ebe7662280a205d'
	'e6e51386d62866b3b9de3cbd5cf875557948fc823852542287f3fc29c8c710f5'
	'caab7b49e4fc696f69ade36b012ceb4abe97552436d2464f9f62fc785ee60f16')

pkgver() {
	cd $pkgname
	printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d "${pkgdir}/usr/include/${_pkgname}"

	for file in ${source[@]:1}; do
		install -Dm644 "${file}" "${pkgdir}/usr/include/${_pkgname}/"
	done

	cd $pkgname
	find 'src' -type f -iname '*.hpp' -exec install -Dm644 {} "${pkgdir}/usr/include/${_pkgname}/" \;
	find 'include' -type f -iname '*.hpp' -exec install -Dm644 {} "${pkgdir}/usr/include/${_pkgname}/" \;
}
