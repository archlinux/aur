# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-neoclip-git
pkgver=r9.d8faa88
pkgrel=1
pkgdesc="Clipboard manager Neovim plugin with Telescope integration"
arch=('any')
url="https://github.com/acksld/nvim-neoclip.lua"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim-telescope')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=neoclip.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	find lua -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
