# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>

pkgname=rtl8821au-dkms-git
_pkgbase=rtl8821au
pkgver=5.1.5.r59.gaf07b27
pkgrel=1
pkgdesc="rtl8821AU, rtl8812AU and rtl8811AU chipset driver with firmware v5.1.5"
arch=('i686' 'x86_64')
url="https://github.com/zebulon2/rtl8812au/tree/v5.1.5"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/zebulon2/rtl8812au.git"
        'dkms.conf')
sha256sums=('SKIP'
            'f0842466dad49a2d0a16fd29e3c5253128b3642d6a42a0a8e08b7310ab265204')


pkgver() {
    cd ${srcdir}/rtl8812au
    printf '%s.r%s.g%s' '5.1.5' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/rtl8812au
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
