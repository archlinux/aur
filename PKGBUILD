# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-material-git
pkgver=r60.3b61e78
pkgrel=1
pkgdesc="Port of the Material colorscheme for Vim/Neovim"
arch=('any')
url="https://github.com/kaicataldo/material.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-airline-material' 'vim-lightline-material')
conflicts=("${pkgname%-git}")
replaces=('vim-airline-material-git' 'vim-lightline-material-git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload colors -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
