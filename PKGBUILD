# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl88x2ce-dkms-git
_pkgbase=rtl88x2ce
pkgver=r50.eb2fff0
pkgrel=1
pkgdesc="Realtek RTL8822CE WLAN GNU/Linux Driver"
arch=('i686' 'x86_64')
license=('unknown')
url="https://github.com/juanro49/rtl88x2ce-dkms"
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}-dkms")
source=("git+https://github.com/juanro49/rtl88x2ce-dkms.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgbase}-dkms
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
