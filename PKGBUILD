# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-aquarium-git
pkgver=r16.ffc3007
pkgrel=1
pkgdesc="Vibrant dark colorscheme"
arch=('any')
url="https://github.com/frenzyexists/aquarium-vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=(
	"${pkgname%-git}"
	'vim-airline-aquarium'
	'vim-lightline-aquarium'
	'neovim-lualine-aquarium')
conflicts=(
	"${pkgname%-git}"
	'vim-airline-aquarium'
	'vim-lightline-aquarium'
	'neovim-lualine-aquarium')
install=
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find autoload colors lua -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
