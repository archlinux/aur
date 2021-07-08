# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-telescope-git
pkgver=r598.c5a6ed1
pkgrel=3
pkgdesc="A highly extensible fuzzy finder for lists"
arch=('any')
url="https://github.com/nvim-telescope/telescope.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'neovim-plenary' 'neovim-popup')
optdepends=('bat: for inline previews'
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
	find data doc lua plugin -not \( -path lua/tests -prune \) \
	  -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
