# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtw8852be-dkms-git
_pkgbase=rtw8852be
pkgver=r224.8046f59
pkgrel=1
pkgdesc="Linux driver for RTW8852BE PCIe card"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/lwfinger/rtw8852be/tree/main"
makedepends=('git')
depends=('dkms' 'bc' 'linux-headers')
conflicts=("${_pkgbase}" "rtl8852be")
source=("git+https://github.com/lwfinger/rtw8852be.git#branch=main"
       'dkms.conf')
sha256sums=('SKIP'
            '8dec8fb7a03c1e69c94fd7d031b9be8ea54f58a628e3d89bb47c6b9ef2deb4f9')

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
