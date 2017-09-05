# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>

_pkgbase=rtl8821au-v5
pkgname=rtl8821au-v5-dkms-git
pkgver=5.1.5
pkgrel=1
pkgdesc="rtl8821AU and rtl8812AU chipset driver with firmware v5.1.5"
arch=('i686' 'x86_64')
url="https://github.com/zebulon2/rtl8812au/tree/v5.1.5"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/zebulon2/rtl8812au.git"
        'dkms.conf')
md5sums=('SKIP'
         'SKIP')



build() {
  cd "rtl8812au"
  make clean
  make
}

package() {
        cd ${srcdir}/rtl8812au
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}