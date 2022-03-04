# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-fern
pkgver=1.40.7
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
sha256sums=('2c2f637063adba0d29b64026750db847ff80912d016c6e58a8f10c2db2626163')

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
