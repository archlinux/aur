_pkgbase='hid-ft260'
_modname=$_pkgbase
pkgname="${_pkgbase}-dkms-git"
pkgver=r81.abd3870
pkgrel=1
pkgdesc='FTDI FT260 Linux kernel driver with UART Support'
arch=('i686' 'x86_64')
license=('GPL')
options=(!emptydirs)
provides=("$_pkgbase")
depends=('dkms' 'gcc' 'make' 'linux-headers')
source=("git+https://github.com/MichaelZaidman/$_pkgbase.git"
        "dkms.conf"
        "Makefile")
sha256sums=('SKIP'
            'ce43c9d910f636f6a401264a5cb7b9acc0c40c9395ff042c3c0a48b1ecd70e83'
            '7155115ed5aa27709688ce9822d3b27627b1f3aafc433fed772c6e5cb4bc05f8')

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgbase}"
    install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
    install -Dm644 "${srcdir}/Makefile" "${srcdir}/dkms.conf" "hid-ft260.c" "hid-ids.h" "${pkgdir}/usr/src/${_modname}-${pkgver}/"
}
