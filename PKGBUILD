# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc
pkgver=0.0.78
pkgrel=3
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('neovim' 'nodejs')
optdepends=('npm: for installing coc extensions'
            'yarn: for installing coc extensions'
            'neovim-coc-extras-meta: some basic extensions')
provides=('neovim-coc')
conflicts=('neovim-coc')
source=('https://github.com/neoclide/coc.nvim/archive/v0.0.78.tar.gz')
sha256sums=('1e9634b9c5de3557d8ecf3057fcaa1958d70a8d433eec2da19d88f8d486c2695')

package() {
    cd "${srcdir}/coc.nvim-${pkgver}"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload bin build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/local/share/nvim/site/pack/coc/start/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim-${pkgver}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
