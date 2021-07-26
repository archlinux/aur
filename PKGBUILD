# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-truezen-git
pkgver=r1080.bd7d0f6
pkgrel=1
pkgdesc="Clean and elegant distraction-free writing for Neovim"
arch=('any')
url="https://github.com/pocco81/truezen.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'vim-goyo')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find doc lua plugin \
	  -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
