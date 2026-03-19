# Maintainer: Stephen JK Hsieh <stepheniseverygood@gmail.com>

pkgname=asix-ax88279-dkms
_pkgname=ax_usb_nic
pkgver=3.5.0
pkgrel=4
pkgdesc="Modernized ASIX AX88279 USB to 2.5G Ethernet DKMS driver"
arch=('x86_64')
url="https://www.asix.com.tw/en/product/USBEthernet/Super-Speed_USB_Ethernet/AX88279"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'linux-headers')
install=${pkgname}.install
source=("${_pkgname}-${pkgver}::git+https://github.com/nehalem-make/ax_usb_nic.git#branch=main"
        "dkms.conf"
        "${pkgname}.install")
sha256sums=('SKIP'
            'a7a384eb02e28a3345de9ef4e66d29c8d1fe6c28ffaf907780a95c75a4173d3d'
            '527706a8ef1d6408f665319be64ab8cf5eb11910291dfcdddb19eb23f3fb9d44')

build() {
    :
}

package() {
    # Copy the driver source code
    install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"

    # Copy dkms.conf file
    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

    # Set the correct variables in dkms.conf
    sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
}
