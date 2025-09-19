# Maintainer: Jan Eil <aur@janeil.de>

_pkgbase=pivccu-modules
pkgname=${_pkgbase}-dkms
pkgver=1.0.85
pkgrel=2
pkgdesc="Kernel modules needed for Homematic"
arch=('x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/alexreinert/piVCCU/"
license=('GPL')
depends=('dkms')
makedepends=('dtc')
conflicts=("${_pkgbase}")
source=('pivccu::git+https://github.com/alexreinert/piVCCU#commit=82d53a2321f87d6cc8b088c4b4b4f282ebce4552'
        'dkms.conf')
sha256sums=('SKIP'
            '76f9f787cd63f567e1393df760afb6ba90db3178c7a6ca7421a1a8d9d403c021')

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
