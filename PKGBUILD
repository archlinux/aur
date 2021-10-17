# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lsp-status-git
pkgver=r71.e8e5303
pkgrel=1
pkgdesc="Utility functions for generating statusline components"
arch=('any')
url="https://github.com/nvim-lua/lsp-status.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5')
optdepends=('nerd-fonts')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=lsp-status.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
