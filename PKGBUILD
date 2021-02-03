# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase=amd-sfh-hid
pkgname="${_pkgbase}-dkms"
pkgver=4.0.5
pkgrel=1
pkgdesc="Refactored HID driver modules for the AMD Sensor Fusion Hub (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/conqp/${pkgname}"
license=('GPL2')
depends=('dkms')
source=("${url}/archive/${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('596efad16fca753553c4bea8662a79002148f2dd9dcef34e1e87f9b3912ad3a5'
            '6cdb0eae3f2aff4564f653d8b7117112918631a170d154cc2fc2998ad8787615')

package() {
	local SRC="${pkgname}-${pkgver}"
	local DEST="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	install -dm 755 "${DEST}"
	cp -a "${SRC}"/* "${DEST}/"

	sed -e "s/@PKGNAME@/${_pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    dkms.conf > "${DEST}/dkms.conf"
}
