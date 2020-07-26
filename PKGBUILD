pkgname=vim-coc-git
pkgver=r514.140321e6
pkgrel=1
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('vim' 'nodejs')
optdepends=('npm: for installing coc extensions' 'yarn: for installing coc extensions')
makedepends=('git')
provides=('vim-coc')
conflicts=('vim-coc')
source=('git+https://github.com/neoclide/coc.nvim.git#branch=release')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/coc.nvim"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/coc.nvim"
    find autoload bin build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
