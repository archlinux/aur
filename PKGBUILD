# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase=amd-sfh-hid
pkgname="${_pkgbase}-dkms"
pkgver=2.8.2
pkgrel=1
pkgdesc="Experimental HID driver modules for the AMD Sensor Fusion Hub (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/conqp/linux.git"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("linux-sfh::git+${url}#tag=${_pkgbase}-${pkgver}"
        'dkms.conf')
sha256sums=('SKIP'
            '989aae3b663ad67652a90ff4cfdde85daa9035a099a5f2e72794ae5715fb6fcd')

package() {
	local DEST="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
	local SRC="linux-sfh/drivers/hid/amd-sfh-hid"

	install -dm 755 "${DEST}"

	for file in "${SRC}"/*.[hc] "${SRC}/Makefile"; do
		install -m 644 "${file}" "${DEST}"
	done

	sed -e "s/@PKGNAME@/${_pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    dkms.conf > "${DEST}/dkms.conf"
}
