# Maintainer: LinRs <LinRs AT users.noreply.github.com>

pkgname=emacs-pelican-mode-git
_pkgname=emacs-pelican-mode
pkgver=v20170808.r12.g65d7caf
pkgrel=1
pkgdesc="minor mode for editing articles and pages in Pelican sites"
arch=('any')
url="https://git.korewanetadesu.com/pelican-mode.git"
license=('GPL3')
depends=('emacs')
makedepends=('git')
install="${_pkgname}.install"
source=("${pkgname}"::git+"${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
build() {
    cd "${srcdir}/${pkgname}"
    make
}
package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/share/emacs/site-lisp"
    install -D -m644 pelican-mode.el pelican-mode.elc "${pkgdir}/usr/share/emacs/site-lisp"
}
