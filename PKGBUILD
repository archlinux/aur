# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-cmp-vsnip-git
pkgver=r11.8d88c92
pkgrel=1
pkgdesc="nvim-cmp source for vsnip"
arch=('any')
url="https://github.com/hrsh7th/cmp-vsnip"
license=('custom:unknown')
groups=('neovim-plugin')
depends=('neovim-cmp' 'vim-vsnip')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cmp-vsnip.install
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
