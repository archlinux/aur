# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=windsurf.vim-git
pkgver=1.20.8.r9.g272c6e2
pkgrel=3
pkgdesc="Free, ultrafast Copilot alternative for Vim and Neovim"
arch=('any')
url="https://github.com/Exafunction/codeium.vim/"
license=('MIT')
groups=(vim-plugins)
depends=(vim-plugin-runtime gzip)
makedepends=(vim)
source=("git+https://github.com/Exafunction/codeium.vim.git")
sha256sums=('SKIP')

pkgver() {
    cd codeium.vim
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd codeium.vim
    vim -E -s -c 'helptags doc' -c 'q' || true
}

package() {
    cd codeium.vim
    mkdir -p "$pkgdir"/usr/share/vim/vimfiles/pack/Exafunction/start/windsurf.vim
    mkdir -p "$pkgdir"/usr/share/nvim/runtime/pack/Exafunction/start
    ln -s ../../../../../vim/vimfiles/pack/Exafunction/start/windsurf.vim "$pkgdir"/usr/share/nvim/runtime/pack/Exafunction/start/
    cp -a autoload doc plugin "$pkgdir"/usr/share/vim/vimfiles/pack/Exafunction/start/windsurf.vim
    install -D -m 644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -D -m 644 -t "$pkgdir"/usr/share/doc/$pkgname README.md codeium-simple-logo.svg windsurf.png
}
