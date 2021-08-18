# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-gesture-git
pkgver=r249.e433adc
pkgrel=1
pkgdesc="Mouse gesture plugin for Neovim"
arch=('any')
url="https://github.com/notomo/gesture.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=gesture.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc lua spec -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
