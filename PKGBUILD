# Maintainer: mikl_ls  <mikl_ls at protonmail dot com>
# Maintainer: Skallwar <estblcsk(at)gmail(dot)com>

pkgname=rtl8821cu-morrownr-dkms-git
_pkgbase=rtl8821cu
_pkgver="5.8.1.7"
pkgver=5.8.1.7.22.88bf0e5
pkgrel=1
pkgdesc="rtl8821cu chipset driver (morrownr fork)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/morrownr/8821cu-20210118"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'bc')
conflicts=("${_pkgbase}-git" "${_pkgbase}-dkms-git")
source=("git+https://github.com/morrownr/8821cu-20210118#branch=main"
        'dkms.conf')
sha256sums=('SKIP'
	    'a0552ddb8658b5416ae373db569f7fef9a111c9b995a85071bd89fd4cf8c804f')

pkgver() {
    cd ${srcdir}/8821cu-20210118
    printf "%s" ${_pkgver} "." "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"

}

package() {
    	cd ${srcdir}/8821cu-20210118
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        mkdir -p ${pkgdir}/etc/modprobe.d
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	cp ${srcdir}/8821cu-20210118/8821cu.conf ${pkgdir}/etc/modprobe.d/8821cu.conf 
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
