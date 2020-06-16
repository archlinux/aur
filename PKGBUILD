# Maintainer: Nazar Vinnichuk <nazar.vinnichuk at tutanota dot com>
pkgname=paclabel-git
_pkgname=${pkgname%-git}
pkgver=r47.e36e2ff
pkgrel=1
pkgdesc="A tiny pacman wrapper that makes possible to attach labels to packages."
url="http://github.com/Kharacternyk/${_pkgname}"
arch=('any')
license=('GPL3')
depends=('ncurses')
optdepends=('ripgrep')
makedepends=('git')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Kharacternyk/${_pkgname}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/paclabel.sh" "${pkgdir}/usr/bin/paclabel"
    install -Dm644 "${srcdir}/${_pkgname}/README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
    install -Dm644 /dev/null "${pkgdir}/etc/${_pkgname}/labels"
    install -Dm644 /dev/null "${pkgdir}/etc/${_pkgname}/labels~"
}
