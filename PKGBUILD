# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgbase=vim-code-minimap-git
pkgname=('vim-code-minimap-git' 'neovim-code-minimap-git')
pkgver=r116.408db1f
pkgrel=1
pkgdesc="Blazing fast minimap for Vim, powered by code-minimap"
arch=('any')
url="https://github.com/wfxr/minimap.vim"
license=('MIT')
groups=('vim-plugins')
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
	provides=("${pkgname%-git}" 'vim-minimap')
	conflicts=("${pkgname%-git}" 'vim-minimap')

	cd "$pkgbase"
	find autoload doc plugin \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dvm 755 bin/minimap_generator.sh -t "$pkgdir/usr/share/vim/vimfiles/bin/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-code-minimap-git()  {
	depends+=('neovim-git')
	provides=("${pkgname%-git}" 'vim-minimap')
	conflicts=("${pkgname%-git}" 'vim-minimap')

	cd "$pkgbase"
	find autoload doc plugin \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 755 bin/minimap_generator.sh -t "$pkgdir/usr/share/nvim/runtime/bin/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
