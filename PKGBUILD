# Contributor: a821 at (nospam) mail de
# Contributor: Kei Kato <kkato978 at gmail dot com>

pkgname=onigmo
pkgver=6.2.0
pkgrel=1
pkgdesc="A regular expressions library forked from Oniguruma."
arch=('x86_64')
url="https://github.com/k-takata/onigmo"
license=('BSD-2-Clause')
depends=('glibc' 'bash')
source=("https://github.com/k-takata/Onigmo/releases/download/Onigmo-$pkgver/onigmo-$pkgver.tar.gz")
sha256sums=('c648496b5339953b925ebf44b8de356feda8d3428fa07dc1db95bfe2570feb76')

build() {
	cd "$pkgname-$pkgver"
	export CFLAGS+=" -std=gnu17"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -dm755 "$pkgdir"/usr/share/doc
	cp -r doc "$pkgdir"/usr/share/doc/$pkgname
	install -Dm755 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
