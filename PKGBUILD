# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-themis-git
pkgver=1.6.0.r0.g3a01ba9
pkgrel=1
pkgdesc="Vim script testing framework"
arch=('any')
url="https://github.com/thinca/vim-themis"
license=('Zlib')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
checkdepends=('vim')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

check() {
	cd "$pkgname"
	./bin/themis test
}

package() {
	cd "$pkgname"
	install -D bin/themis -t "$pkgdir/usr/bin/"
	find doc ftdetect ftplugin indent macros syntax \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
