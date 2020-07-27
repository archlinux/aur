# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-git
pkgver=v0.0.78.r106.g140321e6
pkgrel=2
pkgdesc='Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode'
arch=('any')
url='https://github.com/neoclide/coc.nvim'
license=('MIT')
depends=('vim' 'nodejs')
optdepends=('npm: for installing coc extensions'
            'yarn: for installing coc extensions')
install=vim-coc-git.install
makedepends=('git')
provides=('vim-coc')
conflicts=('vim-coc')
source=('git+https://github.com/neoclide/coc.nvim.git#branch=release'
        'coc-vim-doc.hook'
        'vim-coc-git.install')
sha256sums=('SKIP'
            '71348fe1287df827e7b28c41a0659e0cc8ff541623c3e1cc8fbfc84346199b1d'
            'b7e8a3870c82b4ac59c553b9e6414d85e59b706545416bfc47a17eb1e35e205d')

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
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/coc/start/coc.nvim/{}" \;
    install -Dm 644 "${srcdir}/coc.nvim/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm 644 "${srcdir}"/coc-vim-doc.hook "${pkgdir}"/usr/share/libalpm/hooks/coc-vim-doc.hook
}
