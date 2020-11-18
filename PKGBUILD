# Maintainer: zaszi <admin@zaszi.net>

_pkgbase=vendor-reset
pkgname=vendor-reset-dkms-git
pkgver=r94.6140e2f
pkgrel=1
pkgdesc="Kernel module for vendor-specific hardware reset routines."
arch=('any')
url="https://github.com/gnif/vendor-reset"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=('vendor-reset-git')
source=('git+https://github.com/gnif/vendor-reset.git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$srcdir/$_pkgbase"

    install -d "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"/
    cp -r "${srcdir}/${_pkgbase}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"/
}
