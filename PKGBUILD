# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.128
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent zlib libretls)
makedepends=(pkgconf git)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('99eccb320018d8ec3f0e3390c071399d88b3c5ba8edd61d3e33c49bf25a3920738a788df7c8d726e50a9c444eaf84d98e13ed14af1305ebbbc6f9e649cf03b4d')

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
