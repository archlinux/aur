# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>
# Contributor: dchusovitin <dchusovitin@gmail.com>
# Contributor: unphysicalix <develADDzukuulDE>

pkgname=rtl8812au-dkms-git
_pkgbase=rtl8812au
pkgver=5.13.6.r46.gcbe2fd6
pkgrel=1
pkgdesc="rtl8812AU chipset driver with firmware v5.13.6"
arch=('i686' 'x86_64')
url="https://github.com/morrownr/8812au-20210820"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/morrownr/8812au-20210820.git"
       'dkms.conf')
sha256sums=('SKIP'
	    '9164f68d837976d0992a50875281f22fb7a2a82981346bde33706701f15bbcc8')
pkgver() {
    cd ${srcdir}/8812au-20210820
    printf '%s.r%s.g%s' '5.13.6' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/8812au-20210820
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
