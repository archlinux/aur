# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtw8852be-dkms-git
_pkgbase=rtw8852be
pkgver=r11.4e94214
pkgrel=1
pkgdesc="Linux driver for RTW8852BE PCIe card"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/lwfinger/rtw8852be/tree/main"
makedepends=('git')
conflicts=("${_pkgbase}" "rtl8852be")
source=("git+https://github.com/lwfinger/rtw8852be.git"
       'dkms.conf')
sha256sums=('SKIP'
            '70c218fb75c47d1be0833319ef77f464888974722b241ebce4b85add4509a357')

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