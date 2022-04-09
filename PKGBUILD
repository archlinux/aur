# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-fern
pkgver=1.44.0
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
sha256sums=('7efd9c631ca2f43207c3af88b73ec82f44e7256c75fab40745ea764dce10655a')

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
