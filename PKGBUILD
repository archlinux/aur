# Maintainer: KafCoppelia <k740677208@gmail.com>
# Contributor: ThePuzzlemaker <tpzker (at)thpeuzzlemaker(dot)info>

pkgname=rtl8812au422-dkms-git
_pkgbase=rtl8812au
pkgver=r176.4fa0ce3
pkgrel=1
pkgdesc="Realtek 802.11ac (rtl8812au) v4.2.2 (7502.20130507) driver altered to build on Linux kernel version >= 3.10."
arch=('any')
url="https://github.com/gnab/rtl8812au/tree/master"
license=('GPL2')
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}" 'rtl8812au-dkms-git' 'rtl8821au-dkms-git' 'rtl88xxau-aircrack-dkms-git')
source=("git+https://github.com/gnab/rtl8812au"
        'dkms.conf')
sha256sums=('SKIP'
            'e0645e88941cf78a02ae5b8f257e24f95bc8001f52e9653cf2c88e6941920aef')

pkgver() {
    cd ${srcdir}/rtl8812au
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${srcdir}/rtl8812au
	mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
