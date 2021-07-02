# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-lspfuzzy-git
pkgver=r58.2f172ab
pkgrel=2
pkgdesc="A Neovim plugin to make the LSP client use fzf"
arch=('any')
url="https://github.com/ojroques/nvim-lspfuzzy"
license=('BSD')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'fzf')
optdepends=('vim-fzf: for inline previews')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
