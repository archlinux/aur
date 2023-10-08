# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-trouble-git
pkgver=2.9.0.r0.g2ea761f
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
	git -C "$pkgname" describe --long --tags --match "v[0-9]*" | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$pkgname"
	local dirs=(doc lua plugin)
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
