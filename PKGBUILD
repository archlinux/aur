# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-focus-git
pkgver=r324.fad445b
pkgrel=1
pkgdesc="Neovim plugin for auto-focusing and auto-resizing splits"
arch=('any')
url="https://github.com/beauwilliams/focus.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=focus.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
