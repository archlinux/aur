# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-fern
pkgver=1.50.2
pkgrel=1
pkgdesc="General purpose asynchronous tree viewer"
arch=('any')
url="https://github.com/lambdalisue/fern.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=(
	'gomi: trash-bin functionality'
	'trash-cli: trash-bin functionality'
	'neovim-fixcursorhold: fixes cursor in neovim')
checkdepends=('vim-themis')
provides=('neovim-fern')
replaces=('neovim-fern')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5c6399150d5991573f672f7139b1b31249d8727ee715e037027b17f116e05d32')

check() {
	cd "fern.vim-$pkgver"
	themis test
}

package() {
	cd "fern.vim-$pkgver"
	find autoload doc ftplugin plugin \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
