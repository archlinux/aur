# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-tokyodark-git
pkgver=r47.32be524
pkgrel=1
pkgdesc="TokyoNight inspired colorscheme"
arch=('any')
url="https://github.com/tiagovla/tokyodark.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5')
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
	find after colors lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
