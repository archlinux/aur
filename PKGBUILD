# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase=amd-sfh-hid
pkgname="${_pkgbase}-dkms"
pkgver=2.1.0
pkgrel=1
_patchfile="${_pkgbase}-${pkgver}-${pkgrel}.patch"
pkgdesc="Experimental HID driver modules for the AMD Sensor Fusion Hub (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/conqp/linux.git"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("linux-sfh::${url}#branch=amd-sfh#tag=${_pkgbase}-${pkgver}"
        'dkms.conf')
sha256sums=('SKIP'
            'aac46663193f08c6331b76faa8752b08b3169fe586da337f662c0e43428d94fb'
            '345bebda48d6dda26f8f0c8282f7c276f946fb14d089b831817eb01fd6ea5dce')

package() {
	local DEST="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	install -dm 755 "${DEST}"

	for file in drivers/hid/amd-sfh-hid/*; do
		install -m 640 "${file}" "${DEST}"
	done

	# Copy dkms.conf
	install -m644 dkms.conf "${DEST}"

	# Set name and version
	sed -e "s/@PKGVER@/${pkgver}/" -i "${DEST}/dkms.conf"
}
