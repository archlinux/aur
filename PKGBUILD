# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-luasnip-git
pkgver=r1348.69cb81c
pkgrel=1
pkgdesc="Snippet engine for Neovim"
arch=('any')
url="https://github.com/L3MON4D3/LuaSnip"
license=('Apache')
groups=('neovim-plugin')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=luasnip.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc ftdetect ftplugin lua plugin syntax \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
