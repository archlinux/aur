# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtw8852be-dkms-git
_pkgbase=rtw8852be
pkgver=r11.4e94214
pkgrel=1
pkgdesc="Linux driver for RTW8852BE PCIe card"
arch=('i686' 'x86_64')
license=('GPL-3.0')
url="https://github.com/lwfinger/rtw8852be/tree/main"
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/lwfinger/rtw8852be.git"
       'dkms.conf')
sha256sums=('SKIP'
            '9668c1b267b4380cc64d7dace49ed9c8bc617ef54c83568e2bd89df1bfef365e')

pkgver() {
    cd ${srcdir}/${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/${_pkgbase}
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
