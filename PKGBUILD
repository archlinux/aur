# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl8852be-dkms-git
_pkgbase=rtl8852be
pkgver=r28.28daf8c
pkgrel=1
pkgdesc="Realtek Linux WLAN Driver for RTL8852BE"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/HRex39/rtl8852be/tree/dev"
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/HRex39/rtl8852be.git#branch=dev"
       'dkms.conf')
sha256sums=('SKIP'
            '63e8368df35bb656f5abae3d189604480387ea838ea79d34f98a4d7848cb1b9d')

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
