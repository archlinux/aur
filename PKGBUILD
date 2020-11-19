# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

_pkgname=uivonim
pkgname=${_pkgname}-git
pkgver=v0.26.3.45.g179fe86
pkgrel=1
pkgdesc="Fork of Veonim, a feature-rich cross-platform GUI that leverages the latest Neovim features (floating windows, builtin LSP, Lua) without reliance on VSCode extensions"
arch=('x86_64')
license=('AGPL')
url="https://github.com/smolck/uivonim"
makedepends=('npm' 'git')
depends=('neovim')
optdepends=()
source=("git+https://github.com/smolck/${_pkgname}"
        "${_pkgname}.sh")

sha256sums=('SKIP'
            '8de71b3528e4f40b77d114080a1bb7a2ade4ad73dd6f9799c2cb640d78209af2')

pkgver() {
    cd ${_pkgname}
    git describe --tags | sed 's/-/./g'
}

build() {
    cd ${_pkgname}

    npm ci
    npm run build
}

package() {
    cd ${_pkgname}

    npm run package

    install -d ${pkgdir}/opt
    cp -R dist/linux-unpacked "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${srcdir}/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
}
