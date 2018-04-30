# Maintainer: Nathan Jones <nathanj439@gmail.com>
pkgname=ifstat
pkgver=1.1
pkgrel=1
pkgdesc="A tool to report network interfaces bandwith just like vmstat/iostat do for other system counters"
arch=('i686' 'x86_64')
url="http://gael.roualland.free.fr/ifstat/"
license=('GPL')
install=ifstat.install
source=("http://gael.roualland.free.fr/ifstat/ifstat-$pkgver.tar.gz"
        "0001-a.patch")
md5sums=('b655642c33a626cfe976792fbcd9b6e1'
         '4d299f8c7896b0c5046867070137ad09')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/../0001-a.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --without-snmp
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ifstat2 $pkgdir/usr/bin/ifstat2
	install -Dm644 ifstat2.1 $pkgdir/usr/share/man/man1/ifstat2.1
}
