# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.120
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent zlib libretls)
makedepends=(pkgconf git)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('1655193b80c0492792f1af86ecfb8b4020d43215f87828df74a1a2599ddeba1f35a6549789204390a64e303d2eb3bd6abc6eed4d5f4fa8d77aa672695ac41b79')

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
