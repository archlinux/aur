# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-moonfly-git
pkgver=r413.5635fa6
pkgrel=1
pkgdesc="Monokai and One Dark inspired colorscheme"
arch=('any')
url="https://github.com/bluz71/vim-moonfly-colors"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=(
	"${pkgname%-git}"
	'vim-airline-moonfly'
	'vim-lightline-moonfly'
	'neovim-lualine-moonfly')
conflicts=(
	"${pkgname%-git}"
	'vim-airline-moonfly'
	'vim-lightline-moonfly'
	'neovim-lualine-moonfly')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload colors lua \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	find terminal_themes -type f -exec install -Dm 644 -t "$pkgdir/usr/share/${pkgname%-git}/" '{}' \+
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
