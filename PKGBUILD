# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.2.2
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
	'fix_password_focus.patch'
)

sha512sums=(
	'3365e5bbcdf5e743d6a90dc5bbd6e86909b2f04e1b4d0d528a8849806a1a1be3fbc6be0eeea77a007a48855bc5fdb2d38c5f9c85b483117fc8a50b870b6fa006'
	'c3866c90e6af3ac9d00eefe117cb38800af949978ff97ca82b908e312849f341df624fb5dc0a9a0b0d7cd1ce73aad258439621f365ee2434d3d7beeed231efe7'
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
