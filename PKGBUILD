 
# Maintainer: NovaMoon <novamoon1 (at)gmail(dot)com>

_pkgbase=rtl8812au-v5
pkgname=rtl8812au-v5-dkms-git
pkgver=5.1.5
pkgrel=2
pkgdesc="rtl8812AU Chipset driver"
arch=('i686' 'x86_64')
url="https://github.com/uminokoe/rtl8812AU/tree/driver-5.1.5"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("https://github.com/uminokoe/rtl8812AU/archive/driver-5.1.5.zip"
        'dkms.conf')
md5sums=('SKIP'
         'SKIP')



build() {
  cd "rtl8812AU-driver-${pkgver}"
  make clean
  make
}         

package() {
	cd ${srcdir}/rtl8812AU-driver-${pkgver}
	mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	# Set name and version
	sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
			-e "s/@PKGVER@/${pkgver}/" \
			-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
