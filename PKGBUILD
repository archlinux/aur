# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tabout-git
pkgver=r6.e8c369e
pkgrel=1
pkgdesc="tabout plugin for neovim"
arch=('any')
url="https://github.com/abecodes/tabout.nvim"
license=('Unlicense')
groups=('neovim-plugins')
depends=('neovim>=0.5' 'neovim-tree-sitter')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=tabout.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
