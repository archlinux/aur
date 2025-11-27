# Maintainer: Ben Song <bensongsyz@gmail.com>

_module_name=cp210x
_pkgbase=${_module_name}-overclock
pkgname=${_pkgbase}-dkms
pkgver=0.2
pkgrel=1
pkgdesc="Kernel module for silab cp210x, with patch of cp2102 max baudrate up to 1.5 MHz"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://git.kernel.org"
license=('GPL2')
depends=('dkms')
install=cp210x-overclock.install

source=(
        0001-extend-the-highest-baudrate-of-cp2102-to-be-1.5-MHz.patch
        dkms.conf
        Makefile
        cp210x_v6.16.c
        cp210x_v6.17.c
        )
sha256sums=(
        519f2bff643716b39ef1742d6360d111ec30d17289c702e4f42f50ca5d6b59b4
        33c1290f202398791a01100f378e089c78838c1a192320f646dbc9c0e238d0a9
        fa6ac0d379a7db6dd0dff470abd6230340c9e7a119fa47a110c8029aa82219d3
        3fc058f7536d33dbdaa25e0d28304a9dba439e4b1a7734a539168cd5282f4d6f
        65c329f6be6b09d0b4a3ed2150274480b0caae2e36fa597e436208e757f563b0
        )

package() {
    # Copy sources
    install -Dm644 --target-directory "${pkgdir}"/usr/src/${_module_name}-${pkgver}/ ${source[*]}

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_module_name}-${pkgver}/dkms.conf
}
