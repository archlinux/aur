# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase=amd-sfh-hid
pkgname="${_pkgbase}-dkms"
pkgver=3.0.4
pkgrel=1
pkgdesc="Refactored HID driver modules for the AMD Sensor Fusion Hub (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/conqp/${pkgname}"
license=('GPL2')
depends=('dkms')
source=("${url}/archive/${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('ed816e0ce46f00f5759e050382a17f7e63adc8772d18c5b4076d42f96d911c0e'
            '6cdb0eae3f2aff4564f653d8b7117112918631a170d154cc2fc2998ad8787615')

package() {
	local SRC="${pkgname}-${pkgver}"
	local DEST="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	install -dm 755 "${DEST}"

	for file in "${SRC}"/*.[hc] "${SRC}/Makefile"; do
		install -m 644 "${file}" "${DEST}"
	done

	sed -e "s/@PKGNAME@/${_pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    dkms.conf > "${DEST}/dkms.conf"
}
