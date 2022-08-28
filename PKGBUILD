# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl8188gu-dkms-git
_pkgbase=rtl8188gu
pkgver=r14.23b04ff
pkgrel=1
pkgdesc="Driver for Realtek RTL8188GU chipset wireless cards"
arch=('any')
url="https://github.com/KierPrev/rtl8188gu"
license=('GPL2')
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
provides=("rtl8188gu-dkms")
conflicts=("rtl8188gu-dkms")
source=("git+https://github.com/KierPrev/rtl8188gu.git")

prepare() {
	cd rtl8188gu
	sed -e "s/@PKGVER@/${pkgver}/" -i dkms.conf
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
	
	eject /dev/cdrom0
}
sha256sums=('SKIP')
