# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-telescope-git
pkgver=r806.492f1d3
pkgrel=1
pkgdesc="Extensible fuzzy finder for lists"
arch=('any')
url="https://github.com/nvim-telescope/telescope.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary' 'neovim-popup')
optdepends=(
	'bat: for inline previews'
	'fd'
	'ripgrep'
	'neovim-tree-sitter'
	'vim-devicons')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
