# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.130
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent zlib libretls)
makedepends=(pkgconf git)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('02d6b60d58e5376ef48ba9b1b8b8cc09ff8bbaa9f5a4bdc12d312cceb3b627c8747461544a538277abeb195499af9e9a75c534dca8b22b6469636b39996bb46c')

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
