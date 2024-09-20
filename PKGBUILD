# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cli-fetch-git
pkgver=r32.c3f7fd5
pkgrel=1
pkgdesc="Fetch information about your Linux machine fast"
arch=('any')
url="https://github.com/yak6/cli-fetch"
license=('MIT')
depends=()
makedepends=(
    'gcc'
    'cmake'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    gcc main.c -o cli-fetch 
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}