# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.2.1
pkgrel=1
pkgdesc='A simple and colorful SDDM theme.'
arch=('any')
url='https://github.com/AlfredoRamos/sddm-urbanlifestyle-theme'
license=('GPL3')

depends=('sddm')
provides=("${pkgname}=${pkgver}")

install=${pkgname}.install

source=(
	"${_themename}-${pkgver}.tar.gz::https://github.com/AlfredoRamos/${pkgname}/archive/${pkgver}.tar.gz"
	'password_focus_fix.patch'
)

sha512sums=(
	'2606688a61e755dddd83c1ea8d7810071b857ed7ac9192a21a9f2b9945a7d906a2ed6dd63fa63bd85753981fefaed6bff696532a3af8ad1691fac9cb20cb464c'
	'a70a38b86de090c7abff3690cedfa6a2f555316c49c2fb2b1621643c812efc7c7e123c8fc05402c2b5bb39dc3502fec39e1ecf0d9af4c842da25c0913e82c87f'
)

prepare() {
	# Password focus fix
	cd "${srcdir}"/${pkgname}-${pkgver}
	patch -Np1 < ../password_focus_fix.patch
}

package() {
	# Installing theme
	cd "${srcdir}"/${pkgname}-${pkgver}
	mkdir -p "${pkgdir}"/usr/share/sddm/themes
	cp -R ${_themename} "${pkgdir}"/usr/share/sddm/themes
}
