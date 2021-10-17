# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-luatab-git
pkgver=r22.da6a8f7
pkgrel=1
pkgdesc="Tabline plugin for Neovim"
arch=('any')
url="https://github.com/alvarosevilla95/luatab.nvim"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=luatab.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
