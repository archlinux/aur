# Maintainer: miffi <childofunix (at) gmail(dot)com>
# Contributor: miffi <childofunix (at) gmail(dot)com>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>
# Contributor: dchusovitin <dchusovitin@gmail.com>

pkgname=rtl8812au-20210629-dkms-git
_pkgbase=rtl8812au-20210629
pkgver=5.13.6.r74.g2e76f81
pkgrel=1
pkgdesc="rtl8812AU chipset driver with firmware v5.13.6"
arch=('i686' 'x86_64')
url="https://github.com/morrownr/8812au-20210629"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("rtl8812au")
provides=("rtl8812au")
source=("$pkgname::git+https://github.com/morrownr/8812au-20210629"
        'dkms.conf')
sha256sums=('SKIP'
	    'f0842466dad49a2d0a16fd29e3c5253128b3642d6a42a0a8e08b7310ab265204')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf '%s.r%s.g%s' '5.13.6' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "${srcdir}/${pkgname}"
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
