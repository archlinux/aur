# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=287
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes."
arch=('x86_64')
url="http://www.mersenne.org"
license=('custom')
depends=('curl')
source=("http://www.mersenneforum.org/gimps/p95v${pkgver}.source.zip"
unfuck_makefile.patch)
sha256sums=('a2053861b15d48f931fa9587621b7da285beacda38cd9e8bb77709eeb6c6d251'
            'acd0c109fcc1f6e08de248992b16649802d94e7b15fdfe170b73413adfc3755c')

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
