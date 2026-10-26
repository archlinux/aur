# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.130.1
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent zlib libretls)
makedepends=(pkgconf git)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('81df6a7cd7dc46e4d4828a0a53a2085964586417d94b574cb54f0f9c261c565d29a651e9921640982faf6e2c9f982dab55d19f94438b5505d1bd818fc23b97da')

build () {
	cd "got-portable-$pkgver"
	./configure \
		--prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname \
		--with-gotd-empty-path=/var/empty
	make
}

package () {
	cd "got-portable-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
		README README.portable TODO
}
