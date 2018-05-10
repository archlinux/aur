# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=vim-goyacc
pkgname=${_pkgname}-git
pkgver=0.5.44a2912
pkgrel=1
pkgdesc='Vim Filetype Support for goyacc.'
arch=('any')
url='https://github.com/rhysd/vim-goyacc'
license=('custom:vim')
depends=('vim')
groups=('vim-plugins')
source=("git+https://github.com/rhysd/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    for d in ftdetect indent syntax; do
        cd ${d}
        for f in *.vim; do
            install -Dm644 "${f}" "${pkgdir}/usr/share/vim/vimfiles/${d}/${f}"
        done
        cd ..
    done
}
