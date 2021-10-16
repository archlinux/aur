# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-material-git
pkgver=r184.f8e663a
pkgrel=1
pkgdesc="Material colorscheme for Neovim"
arch=('any')
url="https://github.com/marko-cerovac/material.nvim"
license=('GPL2')
groups=('neovim-plugin')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}" 'neovim-lualine-material')
conflicts=("${pkgname%-git}" 'neovim-lualine-material')
install=material.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

PURGE_TARGETS=(tags)

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find colors doc lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
