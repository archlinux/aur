# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-telescope-git
pkgver=0.1.0.r0.gb79cd6c8
pkgrel=1
pkgdesc="Extensible fuzzy finder for lists"
arch=('any')
url="https://github.com/nvim-telescope/telescope.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
optdepends=(
	'bat: for inline previews'
	'fd'
	'ripgrep'
	'neovim-tree-sitter'
	'vim-devicons')
makedepends=('git')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	find data doc lua plugin \
		-not \( -path lua/tests -prune \) \
	  -type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
