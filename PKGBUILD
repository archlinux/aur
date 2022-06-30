# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl8852be-dkms-git
_pkgbase=rtl8852be
pkgver=r23.6ae975a
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
            'cc727b824008ba9570f23ecef0dc38cfb28994c345138249699e7854b459bdff')
            
pkgver() {
    cd "${_pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgbase}"
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}