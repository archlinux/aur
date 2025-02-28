# Maintainer: Justin Weiss <justin at justinweiss dot com>
# Maintainer: Antheas Kapenekakis <aur at antheas dot dev>
_pkgbase=bmi260
pkgname=${_pkgbase}-dkms
pkgver=1.1.0
pkgrel=1
pkgdesc="Driver for the Bosch BMI260 IMU. Provided as a DKMS module."
arch=(any)
url="https://github.com/hhd-dev/bmi260"
license=('GPL2')
depends=(dkms)
makedepends=(git)
provides=("bmi260=${pkgver}-${pkgrel}")

source=(git+"${url}".git#tag=v${pkgver}
	'dkms.conf')
sha256sums=('9e28f3b9f32d265910953d4da60728e3d56ecf0044646650b8008460379a7700'
            'a7234c31281bb83c382a1d94b4d8843a55d681c6b894d033b2840d008ba84606')

package() {
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	cd "${srcdir}"/"${_pkgbase}"

	# Set name and version
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

	cp -r *.{c,h} Makefile "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
