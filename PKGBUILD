# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-git
_pkg="${pkgname%-git}"
pkgver=0.0.1.r3.gb1ebdb0
pkgrel=1
pkgdesc="Autocompletion plugin for Neovim"
arch=('any')
url="https://github.com/hrsh7th/nvim-cmp"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
optdepends=(
	'neovim-cmp-nvim-lsp: source for Neovim builtin LSP client'
	'neovim-cmp-buffer: buffer autocompletion'
	'neovim-cmp-path: path autocompletion'
	'neovim-cmp-emoji: emoji autocompletion'
	'neovim-cmp-latex-symbols: LaTeX symbol autocompletion'
	'neovim-cmp-omni: omnifunc autocompletion'
	'neovim-cmp-vsnip: vsnip autocompletion')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
install=cmp.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find autoload lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
