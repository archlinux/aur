# Maintainer: dringsim <dringsim@qq.com>

pkgname=neovim-cscope_maps-git
pkgver=r141.a6c8fac
pkgrel=1
pkgdesc="For old school code navigation. Adds cscope support to Neovim 0.9+."
arch=('any')
url="https://github.com/dhananjaylatkar/cscope_maps.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
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
	find doc lua \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
