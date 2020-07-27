# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-git
pkgver=v0.0.78.r106.g140321e6
pkgrel=2
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('neovim' 'nodejs')
optdepends=('npm: for installing coc extensions' 'yarn: for installing coc extensions')
makedepends=('git')
provides=('neovim-coc')
conflicts=('neovim-coc')
source=('git+https://github.com/neoclide/coc.nvim.git#branch=release'
        'coc-neovim-doc.hook')
sha256sums=('SKIP'
            '70cd7d959ea6ca973bd761b6deab922bfa34dd725aab636a0bbc5fbfd60cabaa')

pkgver() {
    cd "${srcdir}/coc.nvim"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/coc.nvim"
    touch doc/tags doc/tags-cn
}

package() {
    cd "${srcdir}/coc.nvim"
    find autoload bin build data doc package.json plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/coc/start/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm 644 "${srcdir}"/coc-neovim-doc.hook "${pkgdir}"/usr/share/libalpm/hooks/coc-neovim-doc.hook
}
