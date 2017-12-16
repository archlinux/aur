# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=ts
pkgver=1.0
pkgrel=1
pkgdesc="A Unix batch system where the tasks spooled run one after the other"
arch=('i686' 'x86_64')
url="http://vicerveza.homeunix.net/~viric/soft/ts/"
license=('GPL2')
source=("http://vicerveza.homeunix.net/~viric/soft/ts/${pkgname}-${pkgver}.tar.gz")
md5sums=('c7589cdc28115d8925794d713ff72dba')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|$(PREFIX)/man/man1|$(PREFIX)/share/man/man1|g' Makefile
	sed -i 's/$(CC) $(LDFLAGS) -o ts/$(CC) $(LDFLAGS) -o tsp/' Makefile
	sed -i 's/$(INSTALL) ts/$(INSTALL) tsp/' Makefile
	sed -i 's/\(^\|\s\)ts/\1tsp/' ts.1
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
	install -D --mode=0644 TRICKS "$pkgdir/usr/share/doc/tsp/TRICKS"
	mv "$pkgdir/usr/share/man/man1/ts.1" "$pkgdir/usr/share/man/man1/tsp.1.gz"
}
