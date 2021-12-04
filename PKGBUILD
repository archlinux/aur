# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=neovim-zenbones
pkgname=('neovim-zenbones' 'vim-zenbones' 'neovim-zenbones-extras')
pkgver=1.0
pkgrel=1
pkgdesc="Contrast-focused Neovim colorscheme"
arch=('any')
url="https://github.com/mcchrish/zenbones.nvim"
license=('MIT')
groups=('neovim-plugins' 'vim-plugins')
makedepends=('git')
source=("$pkgbase::git+$url#tag=v$pkgver?signed")
md5sums=('SKIP')
validpgpkeys=('A9C0645CE9FC1230271A768E9ABC0DCACC50317D')

package_neovim-zenbones() {
	depends=('neovim')
	optdepends=('neovim-lush: enhances included Lua-based colorschemes')
	provides=('neovim-lightline-zenbones' 'neovim-lualine-zenbones')
	conflicts=('neovim-lightline-zenbones' 'neovim-lualine-zenbones')
	install=zenbones.install

	cd "$pkgbase"
	find autoload doc colors lua \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-zenbones() {
	depends=('vim')
	provides=('vim-lightline-zenbones')
	conflicts=('neovim-zenbones' 'vim-lightline-zenbones')

	cd "$pkgbase"
	find autoload doc colors \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-zenbones-extras() {
	pkgdesc='Zenbones color templates for other programs'

	cd "$pkgbase"
	find extras -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/$pkgbase/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
