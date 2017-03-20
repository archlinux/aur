# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=291
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes."
arch=('x86_64')
url="http://www.mersenne.org"
license=('custom')
depends=('curl' 'hwloc')
conflicts=('mprime-bin')
source=("http://www.mersenne.org/ftp_root/gimps/p95v${pkgver}.source.zip"
unfuck_makefile.patch)
sha256sums=('915663ff01fb3530dac51522f3d9584cadb7d483092245e590e8bc2e684ee9be'
            'f643d11a5cd5bdf92e65f7d85486918eaf06a9ba6b3b457845473a7889e5214d')

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
