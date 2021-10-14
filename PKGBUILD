# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp_luasnip-git
pkgver=r32.9674906
pkgrel=1
pkgdesc="nvim-cmp source for LuaSnip"
arch=('any')
url="https://github.com/saadparwaiz1/cmp_luasnip"
license=('custom:unknown')
groups=('neovim-plugin')
depends=('neovim-cmp' 'neovim-luasnip')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cmp_luasnip.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find after lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/$pkgname/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
