# Maintainer: HelloImWar <helloimwar at proton dot me>

pkgname=neovim-ufo-git
_pkgname="${pkgname%-git}"
pkgver=1.3.0.r5.ge3cc802
pkgrel=1
pkgdesc="Not UFO in the sky, but an ultra fold in Neovim."
arch=('any')
url="https://github.com/kevinhwang91/nvim-ufo"
license=('BSD')
groups=('neovim-plugins')
depends=('neovim' 'neovim-promise-async')
optdepends=('neovim-coc: LSP-based folding support'
            'neovim-lspconfig: LSP-based folding support'
	    'neovim-tree-sitter: treesitter-based folding support')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
	find lua doc coc-extension \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/plugins/start/$pkgname/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
