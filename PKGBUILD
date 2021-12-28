# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-aquarium-git
pkgver=0.3.7.r0.g737778b
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
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload colors lua -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
