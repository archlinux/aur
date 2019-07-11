# Maintainer: Michael Taboada <michael@2mb.solutions>

pkgname=rtl88x2bu-cilynx-dkms-git
_pkgbase=rtl88x2bu
pkgver=5.3.1.r32.3aecc50
_pkgver=5.3.1
pkgrel=1
pkgdesc="Kernel module for Realtek rtl88x2bu WiFi chipset"
arch=('i686' 'x86_64')
url="https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("rtl88x2bu-cilynx::git+https://github.com/cilynx/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/rtl88x2bu-cilynx"
    printf '%s.r%s.%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/rtl88x2bu-cilynx"
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -pr * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
    sed -e "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
}

