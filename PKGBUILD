# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=291
pkgrel=5
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes."
arch=('x86_64')
url="http://www.mersenne.org"
license=('custom')
depends=('curl' 'hwloc')
conflicts=('mprime-bin')
source=("http://www.mersenne.org/ftp_root/gimps/p95v${pkgver}.source.zip"
unfuck_makefile.patch)
sha256sums=('b2af302d423765e1f053731f4c0dac6983a9598eb1b16fcf6159491dbb1c3972'
            'c956812ed5f07c8f2f30c906734971f286558ff6267a0c2dfa602e1798e0cef9')

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
