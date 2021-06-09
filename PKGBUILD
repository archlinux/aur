# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>

pkgname=rtl8821au-dkms-git
_pkgbase=8821au
pkgver=5.8.2.3.r75.ga02117b
pkgrel=1
pkgdesc="rtl8821AU and rtl8811AU chipset driver with firmware v5.8.2.3"
arch=('i686' 'x86_64')
url="https://github.com/morrownr/8821au"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/morrownr/8821au.git"
        'dkms.conf')
sha256sums=('SKIP'
            '1bfc187c1d5196e45a2e9240dcaa8a5be57324419e945101bc178026fa5bf48e')


pkgver() {
    cd ${srcdir}/8821au
    printf '%s.r%s.g%s' '5.8.2.3' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/8821au
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
