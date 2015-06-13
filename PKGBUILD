# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=tcpstat
pkgver=1.5
pkgrel=3
pkgdesc="network interface statistics, with output similar to vmstat(8)"
arch=('i686' 'x86_64')
url="http://www.frenchfries.net/paul/tcpstat/"
license=('BSD')
depends=('glibc' 'libpcap')
makedepends=('coreutils' 'gawk' 'make' 'gcc' 'binutils' 'glibc' 'libpcap')
source=($url$pkgname-$pkgver.tar.gz)
md5sums=('93ca0ffb8f319ecf2e42ff925a7e6854')

build() {

	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	# tcpprof not built, so don't install manual page
	rm $pkgdir/usr/man/man1/tcpprof.1

	install -D -m444 LICENSE \
		$pkgdir/usr/share/licenses/$pkgname/LICENSE
}
