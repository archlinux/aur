# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-cmd-parser-git
pkgver=r10.70813af
pkgrel=1
pkgdesc="Command line parser for Neovim plugin authors"
arch=('any')
url="https://github.com/winston0410/cmd-parser.nvim"
license=('unknown')
groups=('neovim-plugins')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
