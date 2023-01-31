# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-bin
pkgver=0.0.82
pkgrel=2
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
sha256sums=('5d4f1533e2a385320fd2043a158e48703c9030d99e385f2860b3b858a36ffef2')

package() {
    cd "${srcdir}/coc.nvim-${pkgver}"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/coc/opt/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim-${pkgver}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
