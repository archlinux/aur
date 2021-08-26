# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-zenbones-git
pkgver=r57.8a4d3ba
pkgrel=1
pkgdesc="Contrast-focused Neovim colorscheme"
arch=('any')
url="https://github.com/mcchrish/zenbones.nvim"
license=('MIT')
groups=('neovim-plugins' 'vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('neovim-lush: for zenbones-lua colorscheme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$pkgname"
	find colors lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
