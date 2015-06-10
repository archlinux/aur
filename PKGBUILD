# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=vim-archversion
pkgname=${_pkgname}-git
pkgver=20141124.r5.a02bd1d
pkgrel=1
pkgdesc="Syntax and detection for Archversion config files"
arch=('any')
url="https://github.com/prurigro/${_pkgname}"
license=('MIT')
depends=('vim')
optdepends=('archversion-git: The Archlinux package version checker that uses this syntax')

source=("git+https://github.com/prurigro/${_pkgname}#branch=master")
sha512sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    install -Dm644 ftdetect/archversion.vim "${pkgdir}/usr/share/vim/vimfiles/ftdetect/archversion.vim"
    install -Dm644 ftplugin/archversion.vim "${pkgdir}/usr/share/vim/vimfiles/ftplugin/archversion.vim"
    install -Dm644 syntax/archversion.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/archversion.vim"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
