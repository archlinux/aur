# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-luasnip-git
pkgver=1.2.1.r30.gd33cf7d
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
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	local dirs=(doc ftplugin lua plugin syntax)
	cd "$pkgname"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
