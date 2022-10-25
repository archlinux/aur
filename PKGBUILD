# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=neovim-zenbones
pkgname=('neovim-zenbones' 'vim-zenbones' 'neovim-zenbones-extras')
pkgver=3.0.0
pkgrel=1
pkgdesc="Contrast-focused Neovim colorscheme"
arch=('any')
url="https://github.com/mcchrish/zenbones.nvim"
license=('MIT')
makedepends=('git')
source=("$pkgbase::git+$url#tag=v$pkgver?signed")
md5sums=('SKIP')
validpgpkeys=('A9C0645CE9FC1230271A768E9ABC0DCACC50317D')

package_neovim-zenbones() {
	groups=('neovim-plugins')
	depends=('neovim')
	optdepends=('neovim-lush: enhances included Lua-based colorschemes')
	provides=('neovim-lightline-zenbones' 'neovim-lualine-zenbones')
	conflicts=('neovim-lightline-zenbones' 'neovim-lualine-zenbones')
	install=zenbones.install

	cd "$pkgbase"
	find autoload doc colors lua \
		-type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-zenbones() {
	pkgdesc="Contrast-focused Vim colorscheme"
	groups=('vim-plugins')
	depends=('vim')
	provides=('vim-lightline-zenbones')
	conflicts=('neovim-zenbones' 'vim-lightline-zenbones')

	cd "$pkgbase"
	find autoload doc colors \
		-type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-zenbones-extras() {
	pkgdesc='Zenbones color templates for other programs'

	cd "$pkgbase"
	find extras -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/$pkgbase/{}" \;
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
