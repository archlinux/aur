pkgname=mrouted
pkgver=3.9.6
pkgrel=3
pkgdesc="mrouted is an implementation of the DVMRP multicast routing protocol. It turns a UNIX workstation into a DVMRP multicast router with tunnel support, in order to cross non-multicast-aware routers."
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/mrouted"
license=('BSD')
source=("http://cloud.github.com/downloads/troglobit/mrouted/mrouted-${pkgver}.tar.bz2"
	"mrouted.service")
md5sums=('e88dfa6a99dd4ee7d8bc7b2dca87ca9e'
         '1724b91d87589847bef83930fdf1da62')

build() {
	cd "$srcdir/${pkgname}-${pkgver}/"

	make || return 1
}
package() {
	cd "$srcdir/${pkgname}-${pkgver}/"
	make prefix=/usr DESTDIR=$pkgdir install || return 1
	install -Dm644 $srcdir/mrouted.service "$pkgdir/usr/bin/systemd/system/mrouted.service"
}
