# Maintainer: Shaun Ren <shaun DOT ren (at) linux (dOt) com>
# Contributor: Simon Hanna <simon DOT hanna (at) serve-me (dOt) info>

pkgname=rtl8812au-inject-dkms-git
_pkgbase=rtl8812au
pkgver=r44.2577553
pkgrel=1
pkgdesc="A kernel module for Realtek 8812au network cards with dkms support, with monitor mode and injection support"
url="https://github.com/astsam/rtl8812au"
license=("GPL")
arch=('any')
makedepends=('git')
depends=('dkms')
source=("git+https://github.com/astsam/rtl8812au.git"
        "dkms.conf")
install="${pkgname}.install"
sha256sums=('SKIP'
            '6d4ea7322b1ccdcd9351232e2e49f10ef93b93bfc2034f494cdd256d0b3bd8c0')
pkgver() {
  cd "${srcdir}/${_pkgbase}"
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
