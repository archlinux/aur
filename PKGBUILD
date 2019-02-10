# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Shaun Ren <shaun DOT ren (at) linux (dOt) com>
# Contributor: Simon Hanna <simon DOT hanna (at) serve-me (dOt) info>

pkgname=rtl88xxau-aircrack-dkms-git
_pkgbase=rtl88xxau
pkgver=r600.983ec8c
pkgrel=1
pkgdesc="Aircrack-ng kernel module for Realtek 88XXau (USB adapters only) network cards (8811au, 8812au, 8814au and 8821au chipsets) with monitor mode and injection support"
url="https://github.com/aircrack-ng/rtl8812au#branch=v5.2.20"
license=('GPL')
arch=('any')
makedepends=('git')
depends=('dkms')
replaces=('rtl8812au-aircrack-dkms-git')
conflicts=('rtl8812au-aircrack-dkms-git'
'rtl8812au-dkms-git'
'rtl8821au-dkms-git'
'rtl8814au-dkms-git'
'rtl8812au-inject-dkms-git')

source=('rtl88xxau::git+https://github.com/aircrack-ng/rtl8812au.git#branch=v5.2.20'
        'dkms.conf')

sha256sums=('SKIP'
            'be0923c2d727f0d64312e879b2887dee04fc5d8c405150a7318a0c9ef08daefc')

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

# vim:set ts=2 sw=2 et: