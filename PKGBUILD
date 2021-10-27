# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-treesitter-git
pkgver=r10.0ba0a99
pkgrel=1
pkgdesc="neovim-cmp source for treesitter"
arch=('any')
url="https://github.com/ray-x/cmp-treesitter"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim-cmp' 'tree-sitter')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cmp-treesitter.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find after lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
