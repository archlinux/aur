# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>

pkgname=rtl8821au-dkms-git
_pkgbase=8821au
pkgver=5.12.5.2.r148.g0bfe654
pkgrel=1
pkgdesc="rtl8821AU and rtl8811AU chipset driver with firmware v5.12.5.2"
arch=('i686' 'x86_64')
url="https://github.com/morrownr/8821au-20210708"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/morrownr/8821au-20210708.git"
        'dkms.conf')
sha256sums=('SKIP'
            'd9a4b788cf3ea9b82a920c927f2de72ddb7e50a3e424219e93f74816c4fa8bd9')

pkgver() {
    cd ${srcdir}/8821au-20210708
    printf '%s.r%s.g%s' '5.12.5.2' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/8821au-20210708
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
