# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase=amd-sfh-hid
pkgname="${_pkgbase}-dkms"
pkgver=4.2.1
pkgrel=1
pkgdesc="Refactored HID driver modules for the AMD Sensor Fusion Hub (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/conqp/${pkgname}"
license=('GPL2')
depends=('dkms')
source=("${url}/archive/${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('c1af588d38efbab638310c0e23c1eab917de946a7e2fb8eb2204275ef5da9606'
            'bc325cc6a2e01f8de499676c345962b95d681fcdc623e995a9c5ddfeb77227af')

package() {
	local SRC="${pkgname}-${pkgver}"
	local DEST="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	install -dm 755 "${DEST}"
	cp -a "${SRC}"/* "${DEST}/"

	sed -e "s/@PKGNAME@/${_pkgbase}/" \
	    -e "s/@PKGVER@/${pkgver}/" \
	    dkms.conf > "${DEST}/dkms.conf"
}
