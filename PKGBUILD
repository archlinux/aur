# Maintainer: Fabrizio del Tin <fdt@euniversity.pub>
pkgname=rtl8852cu-dkms-git
_pkgbase=rtl8852cu
_pkgver="1.0.0"
pkgver=1.0.0.3.a246437
pkgrel=1
pkgdesc="Kernel module for USB WiFi Adapters that use the RTL8852CU and RTL8832CU Chipsets"
arch=('x86_64')
url="https://github.com/lwfinger/rtw8852cu"
license=('GPL2')
depends=('dkms' 'linux-headers' 'git')
makedepends=('git' 'make' 'linux-headers')
conflicts=("${_pkgbase}" "${_pkgbase}-git")
source=("git+https://github.com/lwfinger/rtw8852cu.git"
        "dkms.conf")
sha256sums=('SKIP'
            'e22dcac4ccd9b5db371cc7eb0e947e7ce51b3adcfb64224a638244159331f5ca')
procs_num=$(nproc)

pkgver() {
   cd ${srcdir}/rtw8852cu
   printf '%s' ${_pkgver} "." "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"
}

package(){
  cd ${srcdir}/rtw8852cu
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
