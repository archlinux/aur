# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-range-highlight-git
pkgver=r64.8b5e8cc
pkgrel=1
pkgdesc="Neovim plugin that highlights ranges entered into the command line"
arch=('any')
url="https://github.com/winston0410/range-highlight.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'neovim-cmd-parser')
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
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
