# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-staline-git
pkgver=r229.ad1bef9
pkgrel=1
pkgdesc="Modern lightweight statusline and bufferline"
arch=('any')
url="https://github.com/tamton-aquib/staline.nvim"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=staline.install
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
