# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-blue-moon-git
pkgver=r19.e4943a7
pkgrel=1
pkgdesc="Dark colorscheme derived from palenight and carbonight"
arch=('any')
url="https://github.com/kyazdani42/blue-moon"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim')
optdepends=('neovim-tree-sitter' 'vim-polyglot')
makedepends=('git')
provides=("${pkgname%-git}" 'neovim-lightline-blue-moon')
conflicts=("${pkgname%-git}" 'neovim-lightline-blue-moon')
install=blue-moon.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$pkgname"
	find autoload colors lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
