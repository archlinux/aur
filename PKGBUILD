# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

pkgdesc='Command line tool to make bootable FAT file systems'
pkgname=makebootfat
pkgver=1.6
pkgrel=1
url=https://sourceforge.net/p/advancemame/makebootfat
license=(GPL-2.0-only)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git automake)
_commit=391146bd56b13fe17b356b0415434d59d8d5a211
source=("$pkgname::git+https://git.code.sf.net/p/advancemame/makebootfat#commit=$_commit"
        https://github.com/amadvance/advancemame/raw/1ac78eb12cf69dc5c01df4195d58f333530a4d87/advance/d2/d2.cc)
b2sums=(SKIP
        '37aa18680461181591ef13457b6dddee6808d31c96e4fcba2bb6b31a8f4b0e492a08c511e8fade1e39831cd8e80d229b8af070b321027f5561f53c04302f38d2')

prepare () {
	cd "$pkgname"
	autoreconf -fi
}

build () {
	cd "$pkgname"

	# Build the documentation tool by hand.
	${CXX:-g++} ${CXXFLAGS} -o advd2 "$srcdir/d2.cc" ${LDFLAGS}

	./configure --prefix=/usr --mandir=/usr/share/man
	PATH="$(pwd):$PATH" make
}

package () {
	cd "$pkgname"
	make install DESTDIR="$pkgdir"
}
