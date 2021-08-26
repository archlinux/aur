# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-lush-git
pkgver=r276.71adf07
pkgrel=1
pkgdesc="A colorscheme creation aid for Neovim"
arch=('any')
url="https://github.com/rktjmp/lush.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=lush.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc examples lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
