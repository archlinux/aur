# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-trouble-git
pkgver=r77.7de8bc4
pkgrel=1
pkgdesc="A pretty diagnostics list for Neovim powered by LSP"
arch=('any')
url="https://github.com/folke/trouble.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
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
	find lua plugin \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
