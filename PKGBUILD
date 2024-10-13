pkgname=neovim-texlabconfig-opt-git
pkgver=64.b817297
_pkgname=texlabconfig
pkgrel=1
pkgdesc='Smart and powerful comment plugin for Neovim.'
arch=('any')
url="https://github.com/f3fora/nvim-${_pkgname}"
license=('Unilicense')
depends=('neovim' 'go')
makedepends=('git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')


pkgver() {

    cd "${srcdir}/${_pkgname}"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

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

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
