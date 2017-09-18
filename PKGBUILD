# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>

pkgname=rtl8814au-dkms-git
_pkgbase=rtl8814au
pkgver=4.3.21.r19.gb6b6d56
pkgrel=1
pkgdesc="RTL8814AU and RTL8813AU chipset driver with firmware v4.3.21"
arch=('i686' 'x86_64')
url="https://github.com/zebulon2/rtl8814au"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'bc')
conflicts=("${_pkgbase}")
source=("git+https://github.com/zebulon2/rtl8814au.git"
        'dkms.conf')
sha256sums=('SKIP'
	    'c502336101fb2a1e3753836392f4eaecdee246c1bdc8af207b4ee154e6c1a631')

pkgver() {
    cd ${srcdir}/rtl8814au
    printf '%s.r%s.g%s' '4.3.21' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/rtl8814au
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
