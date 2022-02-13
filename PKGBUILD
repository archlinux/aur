# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-registers
pkgver=1.5.0
pkgrel=1
pkgdesc="Neovim plugin to preview the contents of the registers"
arch=('any')
url="https://github.com/tversteeg/registers.nvim"
license=('GPL3')
groups=('neovim-plugins')
depends=('neovim')
checkdepends=('neovim-plenary')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('64e17f7e40d6c2c1bbcf8bda04cade36c8e4b545416c6d9856e8980551030916')

check() {
	cd "registers.nvim-$pkgver"
	make test
}

package() {
	cd "registers.nvim-$pkgver"
	find lua plugin syntax \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
