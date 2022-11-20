# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl88x2ce-dkms-git
_pkgbase=rtl88x2ce-dkms
pkgver=r37.c90b359
pkgrel=1
pkgdesc="Realtek Linux WLAN Driver for RTL88X2CE"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/juanro49/rtl88x2ce-dkms/tree/master"
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/juanro49/rtl88x2ce-dkms.git#branch=master"
       'dkms.conf')
sha256sums=('SKIP'
            '5fae76253215047cd9020b04274a96742d9a366c9af4129ea06bc7ec63dabc66')

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
