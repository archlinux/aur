# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=papirus-colors-git
pkgver=r5.ae694e1
pkgrel=1
pkgdesc="Papirus folders with KDE Color Scheme support"
arch=('any')
url="https://github.com/varlesh/papirus-colors"
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
	install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/icons"
	cp -rf ${pkgname}/Papirus-Colors* "${pkgdir}/usr/share/icons/"
}
