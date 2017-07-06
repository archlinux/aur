# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=${_themename}-sddm-theme
pkgver=0.4.1
pkgrel=2
pkgdesc='A simple and colorful SDDM theme'
arch=('any')
url='https://github.com/AlfredoRamos/urbanlifestyle-sddm-theme'
license=('GPL3')

optdepends=('sddm: to use this theme')
provides=("${pkgname}=${pkgver}")
replaces=("sddm-${_themename}-theme")

install=${pkgname}.install

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/AlfredoRamos/${pkgname}/archive/${pkgver}.tar.gz"
	"fix_metadata.patch::https://github.com/AlfredoRamos/${pkgname}/commit/7dda527a7d4094767a96ea3b8bdeb92b85684b5f.patch"
)

sha512sums=(
	'46a4c00144c71605ebee72f589b00db05243effa801e9920609581e7352249c946e0d9ae54bd13bf27df2125a310c7276ed80a7f331849c102b4ff05f7fedfc4'
	'33cf75fdc918c2d57e7dea18c2f60a37423c637c590cace820894417e57d1cc4e61775e5562dbd313194ee3944d340ae0b5f71ab77286e449bdd15c0969d3424'
)

prepare() {
	# Fix metadata
	cd "${srcdir}"/${pkgname}-${pkgver}/${_themename}
	patch -Np1 < ../../fix_metadata.patch
}

package() {
	# Installing theme
	cd "${srcdir}"/${pkgname}-${pkgver}
	mkdir -p "${pkgdir}"/usr/share/sddm/themes
	cp -R ${_themename} "${pkgdir}"/usr/share/sddm/themes
}
