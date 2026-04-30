# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl88x2ce-dkms-git
_pkgbase=rtl88x2ce
pkgver=r53.ae4c111
pkgrel=1
pkgdesc="Realtek RTL8822CE WLAN GNU/Linux Driver"
arch=('i686' 'x86_64')
license=('unknown')
url="https://github.com/juanro49/rtl88x2ce-dkms"
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}-dkms")
source=("git+https://github.com/juanro49/rtl88x2ce-dkms.git" "patch.diff")
sha256sums=('SKIP'
            '7423d7a6565dddb15737437660faccdd39c3f4c31c365f6a0e71e0086e7a1e01')

pkgver() {
    cd ${srcdir}/${_pkgbase}-dkms
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgbase}-dkms
    patch --forward -Np1 -i ${srcdir}/patch.diff
}

package() {
    cd ${srcdir}/${_pkgbase}-dkms
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
