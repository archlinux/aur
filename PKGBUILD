# Maintainer: Samuel Čavoj <sammko@sammserver.com>

pkgname=hid-glorious-dkms
_pkgname=hid-glorious
pkgver=1.2
pkgrel=1
pkgdesc="HID kernel module for Glorious PC Gaming race mice"
arch=('x86_64')
url="https://github.com/sammko/hid-glorious"
license=('GPL2')
depends=('dkms')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/sammko/hid-glorious/archive/v${pkgver}.tar.gz")
sha256sums=('8f4c58b02979b49ff45bc8d369b7b2dd396ce3f4b5523009599fcdd6f2b11c0a')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed "s/#MODULE_VERSION/${pkgver}/" dkms.conf.in > dkms.conf
}

package() {

    cd "${_pkgname}-${pkgver}"
    dkmsdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -Dt "${dkmsdir}" -m 644 Makefile hid-glorious.c hid-ids.h dkms.conf
}
