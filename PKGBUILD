# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-themis
pkgver=1.6.0
pkgrel=1
pkgdesc="Vim script testing framework"
arch=('any')
url="https://github.com/thinca/vim-themis"
license=('Zlib')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
checkdepends=('vim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eb92ddb6e59f4e840d89944bf0de19c398f2de1071ebd48c9b99e4d1e871e832')

check() {
	cd "$pkgname-$pkgver"
	./bin/themis test
}

package() {
	cd "$pkgname-$pkgver"
	install -D bin/themis -t "$pkgdir/usr/bin/"
	find doc ftdetect ftplugin indent macros syntax \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
