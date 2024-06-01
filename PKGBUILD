# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='BASIC language cross-compiler for ColecoVision/SG1000/MSX'
pkgname=cvbasic
pkgver=0.5.0
_commit=08a1480f2af5bdd540d30467bfa3d286b34fd627
pkgrel=1
url=https://nanochess.org/cvbasic.html
arch=(x86_64)
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
source=("$pkgname-$pkgver::git+https://github.com/nanochess/CVBasic.git#commit=$_commit"
	    cvbasic-asm-file-paths.patch)
b2sums=('d4cf61ee5ba66a19b0fd62b58efc52c1cc8befdf3a446e7e561e3068b2264b824238d5dcb3ed0b6227f42293962fbffd8b5c9c1eb707268f3f3189a69400d135'
        '491312824d2d689c6439911ba3d5e981445a6999cf403ed1b00fe5090e91b959aa5aba9afc46a6896cd74efb8ed5fd9cc8bfa24aeba5abdedb4956895311bc04')

prepare () {
	cd "$pkgname-$pkgver"
	git apply "$srcdir/cvbasic-asm-file-paths.patch"
}

build () {
	cd "$pkgname-$pkgver"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} -o cvbasic cvbasic.c
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/cvbasic" cvbasic_{pro,epi}logue.asm
	install -Dm755 -t "$pkgdir/usr/bin" cvbasic

	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic" README.md manual.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic/examples" examples/*
}
