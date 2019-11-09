# Maintainer: ThePuzzlemaker <tpzker (at)thepuzzlemaker(dot)info>
# Contributor: ThePuzzlemaker <tpzker (at)thpeuzzlemaker(dot)info>

pkgname=rtl8812au422-dkms-git
_pkgbase=rtl8812au
pkgver=4.2.2.r7502.c20130507
pkgrel=1
pkgdesc="rtl8821AU/rtl8812AU/rtl8811AU driver with firmware version 4.2.2 (7502.20130507) (Tested and working as of Linux kernel 5.3.8-arch1-1)"
arch=('i686' 'x86_64')
url="https://github.com/gnab/rtl8812au/tree/master"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}" 'rtl8812au-dkms-git' 'rtl8821au-dkms-git' 'rtl88xxau-aircrack-dkms-git')
source=("git+https://github.com/gnab/rtl8812au"
        'dkms.conf')
sha256sums=('SKIP'
            '63d3e54d2aa63bfec9b6f3ddbd615a1534a16e554a8aeb3d3c8cc137f63d9e4c')


pkgver() {
    cd ${srcdir}/rtl8812au
}

package() {
        cd ${srcdir}/rtl8812au
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

