# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl8188gu-dkms-git
_pkgbase=rtl8188gu
pkgver=r9.3dddc96
pkgrel=1
pkgdesc="Linux driver for Realtek RTL8188GU"
url="https://github.com/lwfinger/rtl8188gu"
license=('GPL')
arch=('any')
depends=('dkms')
makedepends=('git')
provides=("rtl8188gu-dkms")
conflicts=("rtl8188gu-dkms")
source=("git+https://github.com/lwfinger/rtl8188gu.git" "dkms.conf")
sha256sums=('SKIP'
            '214b8d7ee2968e49be23567d5fa8073cf3da593e71574154e0d41d11b1abd30e')

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
