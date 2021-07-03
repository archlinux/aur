# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-glow-git
pkgver=r29.c5cf6ca
pkgrel=2
pkgdesc="A Neovim plugin that leverages Glow for markdown previews"
arch=('any')
url="https://github.com/npxbr/glow.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'glow')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua plugin \
	  -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
