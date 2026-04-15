# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-embark-git
pkgver=r115.7014644
pkgrel=1
pkgdesc="A deep inky purple theme leveraging bright colors"
arch=('any')
url="https://github.com/embark-theme/vim"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
provides=('vim-embark' 'vim-airline-embark' 'vim-lightline-embark' 'neovim-embark' 'neovim-lualine-embark')
conflicts=('vim-embark' 'vim-airline-embark' 'vim-lightline-embark' 'neovim-embark' 'neovim-lualine-embark')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=('vim-plugin-runtime')
    cd "$pkgname"
    find autoload colors lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
