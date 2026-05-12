# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.125
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent zlib libretls)
makedepends=(pkgconf git)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('82db04d7c656e1c0f74c558de5a176e18a9f384c1fdcfde36bdb6cefd279618d8574b7b08bcbcf2ad8b977cf1b06b8fbfe27c69a1d761e0571a4480a25c4dca6')

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
