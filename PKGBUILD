# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>

_pkgbase=pivccu-modules
pkgname=${_pkgbase}-dkms
pkgver=1.0.27
pkgrel=1
pkgdesc="Kernel modules needed for Homematic"
arch=('arm' 'armv6h' 'armv7h')
url="https://github.com/alexreinert/piVCCU/"
license=('GPL')
depends=('dkms')
makedepends=('dtc')
conflicts=("${_pkgbase}")
source=("pivccu::git+https://github.com/alexreinert/piVCCU#commit=d4a972d79228af2f755ba9684ee3dd8cc38f3706"
        "dkms.conf")
sha256sums=("SKIP"
            "0440113135ab4b9a2d46859abd2854f831e99da06f9e410c56bef199b7d0a6df")

package() {
    install -Dm644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/ \
        pivccu/kernel/* dkms.conf

    # This is in the eq3_char_loop-dkms package
    sed -i '/eq3_char_loop/d' "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile

    # Set name and version in dkms.conf
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

# vim:set sw=4 sts=4 et:
