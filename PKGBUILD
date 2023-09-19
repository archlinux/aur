# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-bin-git
pkgver=0.0.82.r178.gb4735a63
pkgrel=1
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('neovim' 'nodejs')
optdepends=('npm: for installing coc extensions'
            'yarn: for installing coc extensions'
            'watchman: for workspace_didChangeWatchedFiles feature')
makedepends=('git')
provides=('neovim-coc')
conflicts=('neovim-coc')
source=('git+https://github.com/neoclide/coc.nvim.git#branch=release')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/coc.nvim"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/coc.nvim"
    nvim -es --cmd ":helptags doc" --cmd ":q"
    find autoload bin build doc lua package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/coc/opt/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
