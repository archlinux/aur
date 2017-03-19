# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=2810
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes."
arch=('x86_64')
url="http://www.mersenne.org"
license=('custom')
depends=('curl')
conflicts=('mprime-bin')
source=("http://www.mersenne.org/ftp_root/gimps/p95v${pkgver}.source.zip"
unfuck_makefile.patch)
sha256sums=('fdde4652ea12a66487245fbef7980237b2707c595f613cac013e97a489301060'
            '51b9f8a404b3fb6c5cb36e30ab7edde73cfc1f910dbd52cecc58370081142114')

prepare () {
	patch -Np1 -i unfuck_makefile.patch
}

build() {
	cd "$srcdir/gwnum"
	make -f make64

	cd "$srcdir/linux64"
	make
}

package() {
	install -Dm755 linux64/mprime "$pkgdir/usr/bin/mprime"

	# license and documentation
	# x86_64 tarball for 279 includes none of these
	#install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
	#install -Dm644 readme.txt "$pkgdir/usr/share/doc/$pkgname/readme.txt"
	#install -Dm644 stress.txt "$pkgdir/usr/share/doc/$pkgname/stress.txt"
	#install -Dm644 undoc.txt "$pkgdir/usr/share/doc/$pkgname/undoc.txt"
	#install -Dm644 whatsnew.txt "$pkgdir/usr/share/doc/$pkgname/whatsnew.txt"
}
