# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=peak-linux-driver
pkgver=8.18.0
pkgrel=1
pkgdesc='Linux driver for PEAK CAN adapter'
arch=('x86_64')
url='https://www.peak-system.com/fileadmin/media/linux/index.htm'
license=('GPL2')
depends=('dkms')
source=(
    "https://www.peak-system.com/fileadmin/media/linux/files/${pkgname}-${pkgver}.tar.gz"
    "dkms.conf"
)
sha256sums=(
    "48847dc4d5d53c4ba3fce6e410308ade70b77b8252d7f6cebc70300bc13b5b1e"
    "20bffab516811f77d0f0f258c7b31939e93e10c82888b37ea2656e579052d5bc"
)

package() {
    # move source files into /usr/src
    install -d "${pkgdir}/usr/src/${pkgname}-${pkgver}"
    cp -r "${pkgname}-${pkgver}/." "${pkgdir}/usr/src/${pkgname}-${pkgver}/"

    # copy dkms.conf
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"

    # set name and version and dkms.conf
    sed -e "s/@PKGNAME@/${pkgname}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}
