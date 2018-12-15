# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>

_pkgbase=ttyebus
pkgname=${_pkgbase}-dkms
pkgver=1.5
pkgrel=1
pkgdesc="Real time linux kernel module for the ebusd using the PL011 UART on a Rasperry Pi"
arch=('any')
url="https://github.com/eBUS/ttyebus"
license=('GPL3')
depends=('dkms')
conflicts=("${_pkgbase}")

source=("ttyebus::git+https://github.com/eBUS/ttyebus.git#commit=b39d79d8ae8512adefd73d7ea4b296e59769e7d5"
        "dkms.conf")
sha256sums=("SKIP"
            "09fd52fecc4ed818560b1c3a1652dbd8f45badddb114d2c004314e4decf37664")

package() {
    # Copy dkms.conf
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Copy sources (including Makefile)
    cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
