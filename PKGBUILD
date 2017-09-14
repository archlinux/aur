# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>

pkgname=rtl8812au-dkms-git
_pkgbase=rtl8812au
pkgver=5.2.9
pkgrel=2
pkgdesc="rtl8812AU chipset driver with firmware v5.2.9"
arch=('i686' 'x86_64')
url="https://github.com/zebulon2/rtl8812au-driver-5.2.9/tree/txpower"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'bc' 'linux-headers')
conflicts=("${_pkgbase}")
source=("git+https://github.com/zebulon2/rtl8812au-driver-5.2.9.git#branch=txpower"
        'dkms.conf')
sha256sums=('SKIP'
	    'ac5685acf0457773a6a8f83ef2ec84184be3bf26e6472e4b76e31d660964eb6d')


build() {
  cd "rtl8812au-driver-5.2.9"
  make clean
  make
}

package() {
        cd ${srcdir}/rtl8812au-driver-5.2.9
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
