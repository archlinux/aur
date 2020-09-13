# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc
pkgver=0.0.79
pkgrel=1
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('vim' 'nodejs')
optdepends=('npm: for installing coc extensions'
            'yarn: for installing coc extensions'
            'vim-coc-extras-meta: some basic extensions')
provides=('vim-coc')
conflicts=('vim-coc')
source=("https://github.com/neoclide/coc.nvim/archive/v${pkgver}.tar.gz")
sha256sums=('e66acb47ca174ffcc1fee2049c4d018a74d03c25ef6d12926384feb3158aa48b')

package() {
    cd "${srcdir}/coc.nvim-${pkgver}"
    vim -es --cmd ":helptags doc" --cmd ":q"
    find autoload bin build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/coc/start/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim-${pkgver}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
