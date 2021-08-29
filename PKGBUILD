# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-code-minimap-git
pkgname=('vim-code-minimap-git' 'neovim-code-minimap-git')
pkgver=r146.45a8eab
pkgrel=1
pkgdesc="Blazing fast minimap for Vim, powered by code-minimap"
arch=('any')
url="https://github.com/wfxr/minimap.vim"
license=('MIT')
depends=('code-minimap')
makedepends=('git')
source=("$pkgbase::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_vim-code-minimap-git()  {
	depends+=('vim>=8.2')
	groups=('vim-plugins')
	provides=("${pkgname%-git}" 'vim-minimap')
	conflicts=("${pkgname%-git}" 'vim-minimap')

	cd "$pkgbase"
	find autoload doc plugin \
	  -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 755 bin/minimap_generator.sh -t "$pkgdir/usr/share/vim/vimfiles/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-code-minimap-git()  {
	depends+=('neovim>=0.5.0')
	groups=('neovim-plugins')
	provides=("${pkgname%-git}" 'vim-minimap')
	conflicts=("${pkgname%-git}" 'vim-minimap')

	cd "$pkgbase"
	find autoload doc plugin \
	  -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 755 bin/minimap_generator.sh -t "$pkgdir/usr/share/nvim/runtime/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
