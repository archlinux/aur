# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-gitsigns-git
pkgver=r410.ceb2dcb
pkgrel=1
epoch=2
pkgdesc="Git signs written in pure Lua"
arch=('any')
url="https://github.com/lewis6991/gitsigns.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('git' 'neovim>=0.5.0' 'neovim-plenary')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	## upstream broke their tags
	# ( set -o pipefail
	#   git describe --long --tags 2> /dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
	#   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	# )
}

package() {
	cd "$pkgname"
	find doc lua teal -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
