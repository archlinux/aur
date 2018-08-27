# Maintainer: nariox <pedro(dot)nariyoshi(at)gmail(dot)com>

pkgname=rtl8821cu-dkms-git
_pkgbase=rtl8821cu
pkgver=5.2.5.3_24795.20171031.r15.g0c0f555
pkgrel=1
pkgdesc="rtl8821cu chipset driver"
arch=('i686' 'x86_64')
url="https://github.com/whitebatman2/rtl8821CU"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/whitebatman2/rtl8821CU"
        'dkms.conf')
sha256sums=('SKIP'
	    '52eabdd7b4aaecaf3489877d79758129c39703110b803db70872d19b2e88947e')
pkgver() {
    cd ${srcdir}/rtl8821CU
    printf '%s.r%s.g%s' '5.2.5.3_24795.20171031' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/rtl8821CU
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
