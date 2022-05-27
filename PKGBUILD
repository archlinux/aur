# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-bin
pkgver=0.0.81
pkgrel=1
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('neovim' 'nodejs')
optdepends=('npm: for installing coc extensions'
            'yarn: for installing coc extensions'
            'watchman: for workspace_didChangeWatchedFiles feature')
provides=('neovim-coc')
conflicts=('neovim-coc')
source=("https://github.com/neoclide/coc.nvim/archive/v${pkgver}.tar.gz")
sha256sums=('ce5c801a8c58c35231ffce25fa1e63c6e8859713de471204cf1e1401fc18242b')

package() {
    cd "${srcdir}/coc.nvim-${pkgver}"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/coc/start/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim-${pkgver}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
