# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-trouble-git
pkgver=r114.c298a17
pkgrel=1
pkgdesc="A pretty diagnostics list for Neovim powered by LSP"
arch=('any')
url="https://github.com/folke/trouble.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=trouble.install
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=(
	'E57804F976F0B5CE416F56B341F8B1FBACAE2040' ## Folke Lemaitre
	'5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' ## GitHub
)

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
