# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=('vim-vista-git')
_pkgname=vista
pkgver=r249.de344a6
pkgrel=1
pkgdesc='Viewer & Finder for LSP symbols and tags'
arch=('any')
url='https://github.com/liuchengxu/vista.vim'
license=('MIT')
depends=('vim')
optdepends=('ctags: ctags support'
            'vim-coc: lsp symbols support'
            'languageclient-neovim: lsp symbols support'
            'fzf: for searching symbols/tags')
provides=('vim-vista')
conflicts=('vim-vista')
source=("${_pkgname}::git+https://github.com/liuchengxu/vista.vim.git"
        "${_pkgname}-vim-doc.hook")
sha256sums=('SKIP'
            '4888f23eae41c3bc63ee39e018a1434fac8ad62f3af5a9b4cb500121becc7f6c')
makedepends=('git')
_packdir="usr/share/vim/vimfiles/pack/${_pkgname}/start/${_pkgname}"
_variant='vim'

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    touch doc/tags
}

package() {
    cd "${srcdir}/${_pkgname}"
    find autoload doc plugin syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${_pkgname}-${_variant}-doc.hook" "${pkgdir}/usr/share/libalpm/hooks/${_pkgname}-${_variant}-doc.hook"
}
