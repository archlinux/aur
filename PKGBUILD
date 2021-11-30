# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=307b9
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes."
arch=(x86_64)
url="http://www.mersenne.org"
license=('custom')
depends=(curl hwloc boost)
conflicts=(mprime-bin)
source=("http://www.mersenne.org/ftp_root/gimps/p95v${pkgver}.source.zip"
0001-makefile-fix-build-for-Arch-Linux.patch)
b2sums=('0902ffb2263fc1da4f4dd17daceaeff211370e3552b9d5d411721fa3d567c36b822cccda85a10262ca5ca162f83066574a45ab2ec7c6277f63d2099c8cc5d85a'
        'e80b00415ae4dddc03213ddacdb37161984a9c07be2e2a0ed6210c2f9cbe293c74f74c39a1ea81a15d2db502654fbf174cf5adf5839dfba98d8e2c4669d8d814')

prepare () {
	patch -Np1 -i 0001-makefile-fix-build-for-Arch-Linux.patch
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
	install -Dm644 gwnum/readme.txt "$pkgdir/usr/share/doc/$pkgname/readme.txt"
	install -Dm644 gwnum/tutorial.txt "$pkgdir/usr/share/doc/$pkgname/tutorial.txt"
  cp -r prime95/hlp "$pkgdir/usr/share/doc/$pkgname"
}
