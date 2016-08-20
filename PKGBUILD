# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.3.1
pkgrel=1
pkgdesc='A simple and colorful SDDM theme.'
arch=('any')
url='https://github.com/AlfredoRamos/sddm-urbanlifestyle-theme'
license=('GPL3')

depends=('sddm')
provides=("${pkgname}=${pkgver}")

install=${pkgname}.install

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/AlfredoRamos/${pkgname}/archive/${pkgver}.tar.gz"
	'fix_password_focus.patch'
)

sha512sums=(
	'1fa40c8db772b1d39196b6b8babb3052e0ba6d6ad1e13d602f5ac5dbc1d6ef305d1b61d3532e738df4ca9c63a1363de2669588fdca7ca77aef78d65c166ccf39'
	'88f845cd0dee9427f854077775acb4f7ddd7f4aef9f5fee211cdf42dbb2b29544fb3af763c7b0e8d9a910fa6d56c86ab72a62a59721809124b40f8624937c9d6'
)

prepare() {
	# Fix password focus
	cd "${srcdir}"/${pkgname}-${pkgver}
	patch -Np1 < ../fix_password_focus.patch
}

package() {
	# Installing theme
	cd "${srcdir}"/${pkgname}-${pkgver}
	mkdir -p "${pkgdir}"/usr/share/sddm/themes
	cp -R ${_themename} "${pkgdir}"/usr/share/sddm/themes
}
