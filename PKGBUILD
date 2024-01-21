# Maintainer: Maykel Moya <mmoya at mmoya dot org>
pkgname=ax-usb-nic-dkms
_pkgname="${pkgname%-*}"
pkgver=3.0.0
pkgrel=2
arch=('any')
pkgdesc="Kernel module for ASIX USB Ethernet Controller"
url="https://www.asix.com.tw/en/support/download"
license=('GPL2')
depends=('dkms')
_archivename="ASIX_USB_NIC_Linux_Driver_Source_v${pkgver}"
source=("${_archivename}.tar.bz2::https://www.asix.com.tw/en/support/download/file/1522")
sha256sums=('6f81ecdc6589780d00cc3972d1ecabda96267d26e1cfd7c6a5e062f147778216')

package() {
    mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    find -type f -exec chmod 644 {} +
    cp -pr "${_archivename}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -Dm644 ../dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    mkdir -p "${pkgdir}/usr/lib/modprobe.d"
    echo "blacklist ax88179_178a" > "${pkgdir}/usr/lib/modprobe.d/ax-usb-nic.conf"
    echo "blacklist cdc_ncm" >> "${pkgdir}/usr/lib/modprobe.d/ax-usb-nic.conf"
}
