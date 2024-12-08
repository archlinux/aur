# Maintainer: Maykel Moya <mmoya at mmoya dot org>

pkgname=asix-ax88179-dkms
_pkgname="${pkgname%-*}"
pkgver=3.4.0
pkgrel=1
pkgdesc='A kernel module for ASIX AX88179B USB network adapters'
url="https://www.asix.com.tw/en/product/USBEthernet/Super-Speed_USB_Ethernet/AX88179B"
license=('GPL2')
depends=('dkms')
arch=('any')

_archivename="ASIX_USB_NIC_Linux_Driver_Source_v${pkgver}"
source=(
    "${_archivename}.tar.bz2::https://www.asix.com.tw/en/support/download/file/1893"
    'dkms.conf'
    'modprobe.conf'
)
sha256sums=(
    '3bd582dae7a3a7c0f32ecd5dcd8f8971475109aaedb6511ec4b0ce3d55e418eb'
    '280c3fd129bb3ac8b763e65dbbe7383ca795a435021f4c978a7f6b03d696b616'
    '652e3715724de0c1893ffbdfc48a66c7c09e82015429f10254869934dea40b55'
)

package() {
    find -type f -exec chmod 644 {} +

    mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -pr "${_archivename}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

    install -Dm644 ${srcdir}/dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

    install -Dm644 ${srcdir}/modprobe.conf "${pkgdir}/usr/lib/modprobe.d/${_pkgname}.conf"
}
