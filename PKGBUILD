# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=30.19.13
epoch=1
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
        '630b854d53db06980dddb5b4489cb6192cba9205839ced97397ef2cff5c7cc1905443f3bf37608233b84d2a84634dc38a46a40d4239d844cba424fa3a34de15b')

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
