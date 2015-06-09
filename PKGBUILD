# Maintainer: Simon Hanna <simon DOT hanna (at) serve-me (dOt) info>

pkgname=rtl8812au-dkms-git
_pkgbase=rtl8812au
pkgver=8283c82
pkgrel=1
pkgdesc="A kernel module for Realtek 8812au network cards with dkms support"
url="https://github.com/gnab/rtl8812au"
license=("GPL")
arch=('i686' 'x86_64')
depends=('dkms')
source=("git+https://github.com/gnab/rtl8812au.git"
        "dkms.conf")
install="${pkgname}.install"
sha256sums=('SKIP'
            '6d4ea7322b1ccdcd9351232e2e49f10ef93b93bfc2034f494cdd256d0b3bd8c0')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
	git describe --always | sed 's|-|.|g' | cut -f2 -d"v"
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
