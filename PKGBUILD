# Maintainer: Utkan Güngördü <utkan@freeconsole.org>

pkgname=rtl8192fu-dkms-git
_pkgbase=rtl8192fu
pkgver=5.8.6.2.r51.gb4e939d
pkgrel=1
pkgdesc="Driver for Realtek RTL8192FU chipset wireless cards"
arch=('x86_64')
url="https://github.com/kelebek333/rtl8192fu-dkms"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/kelebek333/rtl8192fu-dkms.git"
        'dkms.conf')
sha256sums=('SKIP'
	    '3a8a7441712f958647185a12888c897f06dd8587bcacd85514937a413abc3628')

pkgver() {
    cd ${srcdir}/rtl8192fu-dkms
    printf '%s.r%s.g%s' '5.8.6.2' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
		cd ${srcdir}/rtl8192fu-dkms
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
