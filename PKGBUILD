# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=neovim-zenbones-git
pkgname=('neovim-zenbones-git' 'neovim-zenbones-extras-git')
pkgver=0.11.r12.g2a1191d
pkgrel=1
pkgdesc="Contrast-focused Neovim colorscheme"
arch=('any')
url="https://github.com/mcchrish/zenbones.nvim"
license=('MIT')
groups=('neovim-plugins' 'vim-plugins')
makedepends=('git')
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=('A9C0645CE9FC1230271A768E9ABC0DCACC50317D')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}
package_neovim-zenbones-git() {
	depends=('vim-plugin-runtime')
	optdepends=('neovim-lush: for zenbones-lua colorscheme')
	provides=("${pkgname%-git}" 'neovim-lightline-zenbones' 'neovim-lualine-zenbones')
	conflicts=("${pkgname%-git}" 'neovim-lightline-zenbones' 'neovim-lualine-zenbones')

	cd "$pkgbase"
	find autoload doc colors lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-zenbones-extras-git() {
	pkgdesc='Zenbones color templates for other programs'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$pkgbase"
	find extras -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/${pkgbase%-git}/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
