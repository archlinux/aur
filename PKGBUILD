# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl8852be_bt-dkms-git
_pkgbase=rtl8852be_bt
pkgver=r12.6848d66
pkgrel=1
pkgdesc="Realtek Linux Bluetooth Driver for RTL8852BE for kernel 5.18"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/HRex39/rtl8852be_bt/tree/5.18"
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/HRex39/rtl8852be_bt.git#branch=5.18"
       'dkms.conf')
sha256sums=('SKIP'
        '583094d71b6daef047b3d139e03e4217c6754ddd33cf8997010b48a837ba6d49')
            
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