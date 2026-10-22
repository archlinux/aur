# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=fnt
pkgver=1.9.2
pkgrel=1
pkgdesc='The missing font manager for Linux'
arch=('any')
url='https://github.com/alexmyczko/fnt'
license=('MIT')
depends=('binutils' 'curl' 'lcdf-typetools')
optdepends=('chafa: preview fonts in the terminal'
            'timg: alternative font preview backend'
            'lolcat: colored output')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a3c4c17bb891d773dbf6cccb9479d8d436bb83d4c3d57d7e333a8db8cb9f11b4')
options=('!debug')

prepare() {
	cd "$pkgname-$pkgver"
	# install the zsh completion into /usr/share, not /usr/local
	sed -i 's|ZCOMPDIR=/usr/local/share/zsh/site-functions|ZCOMPDIR=/usr/share/zsh/site-functions|' Makefile
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install

	# documentation
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	# license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
