# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>

pkgname=tcpstat
pkgver=1.5
pkgrel=5
pkgdesc="Network interface statistics, with output similar to vmstat(8)"
arch=('x86_64')
url="https://frenchfries.net/paul/tcpstat"
license=('BSD')
depends=('libpcap')
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname-$pkgver.tar.gz")
sha256sums=('46fde9458cc5678264b0c5f2197f84ada9101951197fdeec5f04b0801fcff0ba')

PURGE_TARGETS=('usr/share/man/man1/tcpprof.1')

prepare() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --mandir=/usr/share/man/
}

build() {
	cd "$pkgname-$pkgver"
	make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
