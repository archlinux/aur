# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributer: xyne <xyne AT archlinux DOT ca>
# Contributer: TryA -  https://bbs.archlinux.org/viewtopic.php?id=114996

pkgname=mprime
pkgver=30.19.20
epoch=2
_pkgver=3019b20
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
b2sums=('8d8db49a07d44195be5724bff2da5ca785692f2b8f67089388b08bef9227654ab11b58c3fb79ca06df594ce660b62eb2694524bdeb96967462d8fabd4beca724'
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
