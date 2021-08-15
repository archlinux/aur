# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-palenight-git
pkgver=r19.847fcf5
pkgrel=1
pkgdesc="A dark colorscheme for Vim/Neovim based on Material Pale Night and onedark.vim"
arch=('any')
url="https://github.com/drewtempelmeyer/palenight.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-airline-palenight' 'vim-lightline-palenight')
conflicts=("${pkgname%-git}")
replaces=('vim-airline-palenight-git' 'vim-lightline-palenight-git')
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
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
