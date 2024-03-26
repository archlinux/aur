# Maintainer: Maykel Moya <mmoya at mmoya dot org>
pkgname=ax-usb-nic-dkms
_pkgname="${pkgname%-*}"
pkgver=3.1.0
pkgrel=1
arch=('any')
pkgdesc="Kernel module for ASIX USB Ethernet Controller"
url="https://www.asix.com.tw/en/support/download"
license=('GPL2')
depends=('dkms')
_archivename="asix_usb_nic_linux_driver_v${pkgver}"
source=("${_archivename}.tar.bz2::https://www.asix.com.tw/en/support/download/file/1735")
sha256sums=('91fefbc25b0672d2089d8fc0aa7114c83e559374c793cd549b1f3678faa0fc8b')

package() {
    mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    find -type f -exec chmod 644 {} +
    cp -pr "${_archivename}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    install -Dm644 ../dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    install -Dm644 ../ax-usb-nic.modprobe.conf "${pkgdir}/usr/lib/modprobe.d/ax-usb-nic.conf"
}
