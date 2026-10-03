# Maintainer: xaverlalo <pass.auf@gmx.de>

_pkgbase=pivccu-modules
pkgname=${_pkgbase}-dkms
pkgver=1.0.89
pkgrel=2
pkgdesc="Kernel modules needed for Homematic"
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/alexreinert/piVCCU/"
license=('GPL')
depends=('dkms')
makedepends=('dtc')
conflicts=("${_pkgbase}")
source=('pivccu::git+https://github.com/xavernitsch/piVCCU#commit=ed329069c739dd9e328da806720dcb702f49def8'
        'dkms.conf')
sha256sums=('c6f5350e9101e6fd91ee40799e3c0179f6206281502a16d540f28b20ed755438'
            '4f6e956bbb5d1c93397f7fa0077bf04a4fa72472054e665f4139779f1f5b8a0e')

package() {
    install -Dm644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/ \
        pivccu/kernel/* dkms.conf


    # Set name and version in dkms.conf
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

# vim:set sw=4 sts=4 et:
