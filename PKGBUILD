# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=30.19.13
epoch=2
_pkgver=3019b13
pkgrel=1
pkgdesc="A GIMPS, distributed computing project client, dedicated to finding Mersenne primes."
arch=(x86_64)
url="http://www.mersenne.org"
license=('custom')
depends=(curl hwloc boost-libs)
makedepends=(boost)
conflicts=(mprime-bin)
source=("https://www.mersenne.org/download/software//v${pkgver%%.*}/${pkgver%.*}/p95v${_pkgver}.source.zip"
        0001-makefile-fix-build-for-Arch-Linux.patch)
b2sums=('d0dbc36269585321a4cef44298b6438ab75f255a5ada5f35aea1218173da5ff04a8593d70cccc3776f45c415b9c1ed4152f3dda23710758ae21be66a94524bf3'
        '524d09fc9670d1d7cfb0550335de0f55e6b5caa3a65588b4725a2c6cbbedb704f179fdb13e28de4a6db784c4529f9ccb4a54b401c7c82b8edad4110fe1c0c784')

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
