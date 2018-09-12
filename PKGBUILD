# Maintainer: Kei Kato <kkato978 at gmail dot com>

pkgname=onigmo
pkgver=6.1.3
pkgrel=1
pkgdesc="A regular expressions library forked from Oniguruma."
arch=('x86_64')
url="https://github.com/k-takata/onigmo"
license=('BSD')
source=("https://github.com/k-takata/Onigmo/releases/download/Onigmo-$pkgver/onigmo-$pkgver.tar.gz")
sha256sums=('ebd3ff0534d3bed9634458e31a55ce25a84e8d3a6b5649611e85839872c777c1')

build() {
	cd "$srcdir"/onigmo-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/onigmo-$pkgver
	make DESTDIR="$pkgdir" install
	install -dm755 "$pkgdir"/usr/share/doc
	cp -r doc "$pkgdir"/usr/share/doc/$pkgname
	for licfile in COPYING INSTALL; do
		install -Dm644 $licfile "$pkgdir"/usr/share/licenses/$pkgname/$licfile
	done
}
