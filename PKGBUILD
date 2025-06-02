# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=plasma-splash-rem-git
pkgver=r3.9ab6d38
pkgrel=1
pkgdesc="A splash screen loading screen featuring best girl: REM!"
arch=('any')
url="https://github.com/DhominickJ/sumi"
license=('GPLv3')
depends=('plasma-desktop')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mv -f "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgname}/.git"
	cp -rf "${pkgname}" "${pkgdir}/usr/share/plasma/look-and-feel/"
}
