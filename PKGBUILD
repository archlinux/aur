# Maintainer: abraar <abraarsameer (at) proton (dot) me>

pkgname=rtl8812au-aircrack-ng-dkms-git
_pkgbase=rtl8812au
pkgver=5.6.4.2_20230501.f23979f
pkgrel=1
pkgdesc="RTL8812AU/21AU and RTL8814AU driver with monitor mode and frame injection"
arch=('i686' 'x86_64')
url="https://github.com/aircrack-ng/rtl8812au"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/aircrack-ng/rtl8812au")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/rtl8812au
    printf '%s.%s' "$(sed -n 's/PACKAGE_VERSION="\([^"]*\)"/\1/p' dkms.conf | tr '~' '_')" "$(git rev-parse --short HEAD)"
}

package() {
    # Copy sources (including Makefile)
    mkdir -p "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
    cp -pr ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

    # Remove unnecessary files for build
    cd "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
    rm -r android/ docs/ tools/
}
