# Maintainer: Samuel Čavoj <sammko@sammserver.com>

pkgname=hid-glorious-dkms
_pkgname=hid-glorious
pkgver=1.0
pkgrel=1
pkgdesc="HID kernel module for Glorious PC Gaming race mice"
arch=('x86_64')
url="https://github.com/sammko/hid-glorious"
license=('GPL2')
depends=('dkms')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/sammko/hid-glorious/archive/v${pkgver}.tar.gz")
sha256sums=('9ce11c69eb4e5a91deb8e70b8a170d3a611d421e14def38545943b6a11c8d477')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed "s/#MODULE_VERSION/${pkgver}/" dkms.conf.in > dkms.conf
}

package() {

    cd "${_pkgname}-${pkgver}"
    dkmsdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -Dt "${dkmsdir}" -m 644 Makefile hid-glorious.c hid-ids.h dkms.conf
}
