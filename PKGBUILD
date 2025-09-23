# Maintainer: Stephen JK Hsieh <stepheniseverygood@gmail.com>

pkgname=asix-ax88279-dkms
_pkgname=ax_usb_nic
pkgver=3.5.0
pkgrel=3
pkgdesc="Patched ASIX AX88279 USB 3.2 to 2.5G Ethernet Adapter DKMS driver (supports modern kernels)"
arch=('x86_64')
url="https://www.asix.com.tw/en/product/USBEthernet/Super-Speed_USB_Ethernet/AX88279"
license=('MIT')
depends=('dkms')
makedepends=('git' 'linux-headers')
install=${pkgname}.install
source=("${pkgname}-${pkgver}::git+https://github.com/stephenjkhsieh/ASIX-USB-NIC-Linux-Driver-Source.git#tag=v${pkgver}-${pkgrel}"
        "dkms.conf"
        "${pkgname}.install")
sha256sums=('SKIP'
            'b4e08dd9852af71af70f5cc899bd165eea3a7df4fb7b3df733e369c6fea232e2'
            '527706a8ef1d6408f665319be64ab8cf5eb11910291dfcdddb19eb23f3fb9d44')

build() {
    :
}

package() {
    # Copy the driver source code
    install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -r "${srcdir}/${pkgname}-${pkgver}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"

    # Copy dkms.conf file
    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

    # Set the correct variables in dkms.conf
    sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

    # Install the license file
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
