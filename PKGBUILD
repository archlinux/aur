# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.1.7
pkgrel=4
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
	'c571c8c7a62e92d969ea7fe93ceef22e35a88c7b279b77548a1978526dffdbfe3453cf53c44de4f0894eb61e5ccdfa62bffa80fe98e9e3a5c943ace231246b15'
	'8b4c3441fa624021d1af205c40c38050c4d59953f40fafeeff263b493b28db8ce6a3d140a2f8f9df96e84fc6e90e41d3bbe2a215a129e72fa05dc12d1f9f558c'
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
