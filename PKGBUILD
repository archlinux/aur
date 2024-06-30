# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='BASIC language cross-compiler for ColecoVision/SG1000/MSX'
pkgname=cvbasic
pkgver=0.5.1
_commit=5ef09b297431dd4f5ba772981f956f44171b420c
pkgrel=1
url=https://nanochess.org/cvbasic.html
arch=(x86_64)
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
source=("$pkgname-$pkgver::git+https://github.com/nanochess/CVBasic.git#commit=$_commit"
	    cvbasic-asm-file-paths.patch)
b2sums=('0f9613bccd0d64c7bce6950581f1571db65fa8d511c7701f2fa69adbc4ff121a0b4629fe9880944e437380c073bab0919b98d746a3c42f4b7b0e37e21b38586d'
        '491312824d2d689c6439911ba3d5e981445a6999cf403ed1b00fe5090e91b959aa5aba9afc46a6896cd74efb8ed5fd9cc8bfa24aeba5abdedb4956895311bc04')

prepare () {
	cd "$pkgname-$pkgver"
	git apply "$srcdir/cvbasic-asm-file-paths.patch"
}

build () {
	cd "$pkgname-$pkgver"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o cvbasic cvbasic.c node.c
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/cvbasic" cvbasic_{pro,epi}logue.asm
	install -Dm755 -t "$pkgdir/usr/bin" cvbasic

	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic" README.md manual.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic/examples" examples/*
}
