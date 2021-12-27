# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-sidebar-dev-git
pkgver=r197.b919936
pkgrel=1
pkgdesc="Generic and modular sidebar"
arch=('any')
url="https://github.com/sidebar-nvim/sidebar.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-dev-git}")
conflicts=("${pkgname%-dev-git}")
install=sidebar.install
source=("$pkgname::git+$url#branch=dev")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 doc/sidebar.txt -t "$pkgdir/usr/share/nvim/runtime/doc/"
	find lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	find doc README.md \
		-type f \
		-name '*.md' \
		-exec install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \+
}
