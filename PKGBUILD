# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>

_pkgbase=eq3_char_loop
pkgname=${_pkgbase}-dkms
pkgver=2.19.9
pkgrel=1
pkgdesc="eQ-3 IPC loopback char driver"
arch=('arm' 'armv6h' 'armv7h')
url="https://github.com/eq-3/occu"
license=('GPL')
depends=('dkms')
conflicts=("${_pkgbase}")

source=("https://github.com/eq-3/occu/raw/${pkgver}/KernelDrivers/${_pkgbase}.c"
        "Makefile"
        "Kbuild"
        "dkms.conf")
sha256sums=("88093c1c242830f9d336b4e2cae53e38f83432640566470e48042f728216924f"
            "f4d92e560e8501b13d95e9a8f2e2d9c03acdb994c5b2de8d7f9cda5682550085"
            "28c7d141374ea40099f6cef84ad601443e044a8278699269627d531030320756"
            "09fd52fecc4ed818560b1c3a1652dbd8f45badddb114d2c004314e4decf37664")

package() {
    install -Dm644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/ \
	    ${_pkgbase}.c Makefile Kbuild dkms.conf

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
