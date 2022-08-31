# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-renamer
pkgver=5.1.0
pkgrel=1
pkgdesc="VSCode-like renaming for Neovim"
arch=('any')
url="https://github.com/filipdutescu/renamer.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plenary')
install=renamer.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d6a5988faa4898ee96056a0b00ff1799fbfb446c3f00c2202eb304a260b5aae')

check() {
	cd "renamer.nvim-$pkgver"
	make test
}

package() {
	cd "renamer.nvim-$pkgver"
	find autoload doc lua plugin \
		-not \( -path "lua/tests" -prune \) \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
