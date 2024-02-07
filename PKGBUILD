# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>

_pkgbase=ayaneo-platform
pkgname=ayaneo-platform-dkms-git
pkgver=v0.1.1.r0.g00da2e0
pkgrel=1
pkgdesc="Linux Driver for Ayaneo x86 handhelds"
arch=('x86_64')
url="https://github.com/ShadowBlip/ayaneo-platform"
license=('GPL')
conflicts=('ayaneo-platform')
depends=('dkms')
makedepends=('git')
source=("$_pkgbase::git+https://github.com/ShadowBlip/ayaneo-platform.git"
	"dkms.conf")
sha256sums=(
	'SKIP'
	'9143c5abacaeffb5389dc9d1b95562c806c9399b1213aa939c7086a19d937e0d'
)

pkgver() {
	cd "$srcdir/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${_pkgbase}"

	install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
	cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

	install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
