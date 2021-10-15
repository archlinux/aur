# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-registers-git
pkgver=1.2.0.r4.g3f522bd
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim>=0.4.4')
makedepends=('git')
checkdepends=('neovim-plenary')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

check() {
	cd "$pkgname"
	make test
}

package() {
	cd "$pkgname"
	find lua plugin syntax \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
