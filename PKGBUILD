# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-deus-git
pkgver=r8.04761b9
pkgrel=1
pkgdesc="A better color scheme for the late night coder -- Neovim port with treesitter support"
arch=('any')
url="https://github.com/theniceboy/nvim-deus"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}" 'vim-deus')
conflicts=("${pkgname%-git}" 'vim-deus')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find colors lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
