# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-range-highlight-git
pkgver=r59.f1b0e2a
pkgrel=2
pkgdesc="Neovim plugin that highlights ranges entered into the command line"
arch=('any')
url="https://github.com/winston0410/range-highlight.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-cmd-parser-git')
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
	find lua -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
