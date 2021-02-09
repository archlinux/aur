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
source=("${_pkgname}::git+https://github.com/liuchengxu/vista.vim.git")
sha256sums=('SKIP')
makedepends=('git')
_packdir="usr/share/nvim/runtime/pack/${_pkgname}/start/${_pkgname}"
_variant='neovim'

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload doc plugin syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
