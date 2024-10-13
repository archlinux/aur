# Maintainer: shanewstone gmail

pkgname=neovim-texlabconfig-opt-git
pkgver=r64.b817297
_pkgname=texlabconfig
pkgrel=1
pkgdesc='Forward and Inverse Search for Texlab and neovim'
arch=('x86_64')
url="https://github.com/f3fora/nvim-${_pkgname}"
license=('Unlicense')
depends=('neovim')
makedepends=('git' 'go')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')


pkgver() {

    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build () {

    cd "${srcdir}/${_pkgname}"

    go build -trimpath -buildmode=pie .

}

package() {

    cd "${srcdir}/${_pkgname}"

    local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}/"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rvt "${pkgdir}/${_installpath}" doc lua

    install -dvm755 "${pkgdir}/usr/bin"

    cp -vt "${pkgdir}/usr/bin" nvim-texlabconfig

}
