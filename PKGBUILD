# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-popup-git
pkgver=r15.5e3bece
pkgrel=2
pkgdesc="A WIP implementation of the Popup API from Vim in Neovim"
arch=('any')
url="https://github.com/nvim-lua/popup.nvim"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'neovim-plenary')
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
	find lua -not \( -name tests -prune \) \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
