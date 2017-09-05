# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>

_pkgbase=rtl8812au-v5
pkgname=rtl8812au-v5-dkms-git
pkgver=5.2.9
pkgrel=1
pkgdesc="rtl8812AU chipset driver with firmware v5.2.9"
arch=('i686' 'x86_64')
url="https://github.com/zebulon2/rtl8812au-driver-5.2.9/tree/txpower"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/zebulon2/rtl8812au-driver-5.2.9.git#branch=txpower"
        'dkms.conf')
md5sums=('SKIP'
         'SKIP')



build() {
  cd "rtl8812au-driver-5.2.9"
  make clean
  make
}

package() {
        cd ${srcdir}/rtl8812au-driver-5.2.9 #rtl8812au
	# Remove the .deb package
	rm -f gord-rtl8812au-dkms_1.0-9_amd64.deb
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
