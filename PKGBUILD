# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>

pkgname=rtl8812au-dkms-git
_pkgbase=rtl8812au
pkgver=5.2.20.r9.gaca1e06
pkgrel=3
pkgdesc="rtl8812AU chipset driver with firmware v5.2.20"
arch=('i686' 'x86_64')
url="https://github.com/zebulon2/rtl8812au-driver-5.2.20"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/zebulon2/rtl8812au-driver-5.2.20.git"
        'dkms.conf')
sha256sums=('SKIP'
	    '544963143f017a13f742fc161a6150ea167a88fd7beacd4cc8e4cbdb6408c492')

pkgver() {
    cd ${srcdir}/rtl8812au-driver-5.2.20
    printf '%s.r%s.g%s' '5.2.20' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/rtl8812au-driver-5.2.20
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
