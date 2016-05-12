# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.3.0
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
	'a1672406f05428d8a9b5c41f9468479f267412016e4fc9c234f14effdbbe8339125b831008684eac17111b19a88a70095b7e79131fe34df56b55884139ffda81'
	'24f697114c75b0a759158c84e3ada3df3b8f8d3ec3f0d0e26ef0d5a4235cb8b7b8716c77bb23ae01cf4364f1afb837bb27b811ad642f35038cddc4658e4760ea'
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
