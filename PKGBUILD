# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=('neovim-vista-git')
_pkgname=vista
pkgver=r249.de344a6
pkgrel=1
pkgdesc='Viewer & Finder for LSP symbols and tags'
arch=('any')
url='https://github.com/liuchengxu/vista.vim'
license=('MIT')
depends=('neovim')
optdepends=('ctags: ctags support'
            'neovim-coc: lsp symbols support'
            'languageclient-neovim: lsp symbols support'
            'fzf: for searching symbols/tags')
provides=('neovim-vista')
conflicts=('neovim-vista')
source=("${_pkgname}::git+https://github.com/liuchengxu/vista.vim.git"
        "${_pkgname}-neovim-doc.hook")
sha256sums=('SKIP'
            '9e0343333fad74fbd24ad7e97dc4568389409d7dbf98b842937736b6aa952833')
makedepends=('git')
_packdir="usr/local/share/nvim/site/pack/${_pkgname}/start/${_pkgname}"
_variant='neovim'

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
