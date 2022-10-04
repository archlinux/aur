# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=30.8.15
epoch=1
_pkgver=308b15
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes."
arch=(x86_64)
url="http://www.mersenne.org"
license=('custom')
depends=(curl hwloc boost-libs)
makedepends=(boost)
conflicts=(mprime-bin)
source=("http://www.mersenne.org/ftp_root/gimps/p95v${_pkgver}.source.zip"
0001-makefile-fix-build-for-Arch-Linux.patch)
b2sums=('9ec5da2125b62630da84cad91b2293403fbdc9d86eb3b03a3b943256417f816cdfff1d8c5af9f6e7604c5cc628c65c13161437e19468985b7b037562fc1050da'
        '8b6f218b70d89d76b555e0955d480e7112279dd87f8f6101dd10eaf9b8de846d9fd469a7ba0ba7685ed68aa40fff240e0c7a9002380e4482ddf44d69b285587c')

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

# vim:set ts=2 sw=2 et:
