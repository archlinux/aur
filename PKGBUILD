# Maintainer: Nazar Vinnichuk <nazar.vinnichuk at tutanota dot com>
pkgname=viter-git
_pkgname=${pkgname%-git}
pkgver=r160.29b9d50
pkgrel=1
pkgdesc="A Vim-ish terminal emulator written and expandable in Python."
url="http://github.com/Kharacternyk/${_pkgname}"
arch=('any')
license=('GPL3')
depends=('python-gobject' 'vte3')
makedepends=('git')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Kharacternyk/${_pkgname}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/viter.py" "${pkgdir}/usr/bin/viter"
    ln -s "${pkgdir}/usr/bin/viter" "${pkgdir}/usr/bin/viter-pager"

    install -Dm644 \
    "${srcdir}/${_pkgname}/README.rst" \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
}
