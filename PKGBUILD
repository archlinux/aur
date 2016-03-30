# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.2.0
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
	'6ec35568d91fa0a155d286823fe74b9933d5400df05e8ed5b463b0e4d7bcf04e5f752c20dc68543b50ef306d22e9ac1e38854b61b5b55a90c4feae5fe89366e4'
	'ec7b22a50ffe98c3a447dedd9b521b4d7fe43f34a6e5b1aa7589b7be122a3e8bd3e91c4f780ea0f5222421ecd9f226ecc1ae7f060a0db9cd816b0478bc4db1fc'
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
