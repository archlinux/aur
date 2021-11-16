# Maintainer: Roman Mishin <xtradev (a) yandex (.) ru>

pkgname=nodebrain
pkgver=0.9.04
pkgrel=1
pkgdesc='A Rule Engine for State and Event Monitoring'
arch=('i686' 'x86_64')
url='http://www.nodebrain.org/'
license=('MIT' 'custom:NodeBrain')
depends=('openssl-1.0')
source=("$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/nodebrain/files/nb/0.9.x%20Columbo/$pkgname-$pkgver.tar.gz/download"
        'nbhash.patch')
sha1sums=('0334b966860ffac8b2580270c10a03713e9ec93f'
          '6cb45c3d2766796ef3ed1596b124171c3314168f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/"
	patch lib/nbhash.c ../../nbhash.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	./configure --prefix=/usr CFLAGS='-I/usr/include/openssl-1.0/' LDFLAGS='-L/usr/lib/openssl-1.0/' LIBS='-lssl -lcrypto'
	make
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir/" install
}

