# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-nvim-lua-git
pkgver=r6.d276254
pkgrel=1
pkgdesc="nvim-cmp source for Neovim's Lua API"
arch=('any')
url="https://github.com/hrsh7th/cmp-nvim-lua"
license=('custom:unknown')
groups=('neovim-plugins')
depends=('neovim-cmp')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find after lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/pack/dist/start/${pkgname%-git}/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
