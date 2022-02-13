# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=vim-fern
pkgname=('vim-fern' 'neovim-fern')
pkgver=1.40.4
pkgrel=1
pkgdesc="General purpose asynchronous tree viewer"
arch=('any')
url="https://github.com/lambdalisue/fern.vim"
license=('MIT')
optdepends=(
	'gomi: trash-bin functionality'
	'trash-cli: trash-bin functionality')
checkdepends=('vim-themis')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e96dd6768e6ceaeddf10b369774d428c6f0d32c9e9a00f41de9ceb7cebb44558')

check() {
	cd "fern.vim-$pkgver"
	themis test
}

package_vim-fern() {
	depends=('vim')
	groups=('vim-plugins')

	cd "fern.vim-$pkgver"
	find autoload doc ftplugin plugin \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_neovim-fern() {
	depends=('neovim' 'neovim-fixcursorhold')
	groups=('neovim-plugins')

	cd "fern.vim-$pkgver"
	find autoload doc ftplugin plugin \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
