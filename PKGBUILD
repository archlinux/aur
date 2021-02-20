# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc
pkgver=0.0.80
pkgrel=2
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('vim' 'nodejs')
optdepends=('npm: for installing coc extensions'
            'yarn: for installing coc extensions'
            'watchman: for workspace_didChangeWatchedFiles feature'
            'vim-coc-extras-meta: some basic extensions')
provides=('vim-coc')
conflicts=('vim-coc')
source=("https://github.com/neoclide/coc.nvim/archive/v${pkgver}.tar.gz")
sha256sums=('6bc817a8fcb42ed4ce139bb128a0087520be1c73d197968b163e9125c9a80ba6')

package() {
    cd "${srcdir}/coc.nvim-${pkgver}"
    vim -es --cmd ":helptags doc" --cmd ":q"
    find autoload bin build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/coc/start/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim-${pkgver}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
