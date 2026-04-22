# Maintainer: Lily <pika@pikafan.de>
pkgname=ipqbdb
pkgver=2.02
pkgrel=1
pkgdesc="IPtables Queues based on Berkeley DB and regular expressions."
arch=(x86_64)
url="https://savannah.nongnu.org/projects/ipqbdb"
license=('GPL-3.0-only')
depends=(libmnl libnfnetlink libnetfilter_queue db pcre popt curl glibc)
makedepends=(perl) # for pod2man
source=("$pkgname-$pkgver.tar.gz::https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6a688c0b6f9c7ee3cf335760f074295bb0a0179bcee4b950a3cb2826d0b5c671')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
