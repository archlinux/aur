# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=(vim-melange vim-melange-extras)
pkgver=0.9.0
pkgrel=1
pkgdesc='Warm colorscheme for Vim and others'
arch=('any')
url="https://github.com/savq/melange"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('75345edc98920d84f7af652bd292d750eb8b960af65705ecbe3037129f1e4727')

package_vim-melange() {
	groups=('vim-plugins')
	depends=('vim-plugin-runtime')
	optdepends=('neovim-lush: extends colorscheme')
	provides=('neovim-melange')

	cd "melange-$pkgver"
	find colors lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_vim-melange-extras() {
	pkgdesc="Extra config files using Melange colorscheme"
	cd "melange-$pkgver"
	find palette term \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/$pkgbase/{}" \;
}
