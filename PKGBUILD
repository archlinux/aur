# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='BASIC language cross-compiler for ColecoVision/SG1000/MSX and other 8 bit computers'
pkgname=cvbasic
pkgver=0.7.1
_commit=9b56f5a00b0e0fbc51f7b5ac2db86f873d64c3d7
pkgrel=1
url=https://nanochess.org/cvbasic.html
arch=(x86_64)
license=(BSD-2-Clause)
depends=(glibc)
makedepends=(git)
optdepends=('gasm80: Assembler needed to build Z80/6502 binaries')
source=("$pkgname-$pkgver::git+https://github.com/nanochess/CVBasic.git#commit=$_commit")
b2sums=('e47ce2e0b94b3eea25459bc1a3a7ca9756d68f114ae202f198e883df34d63b3158e0e7f9b64e75c4645eb35e4a088b8b2d2917a7eab3a5e56680f3e70168d615')

build () {
	cd "$pkgname-$pkgver"
	"${CC:-gcc}" ${CFLAGS} ${LDFLAGS} \
		-DASM_LIBRARY_PATH=\"/usr/share/cvbasic\" \
		-o cvbasic cvbasic.c node.c driver.c cpuz80.c cpu6502.c cpu9900.c
}

package () {
	cd "$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/cvbasic" cvbasic_{,6502_,9900_}{pro,epi}logue.asm
	install -Dm755 -t "$pkgdir/usr/bin" cvbasic

	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic" README.md manual.txt 'README - TI99.md' linkticart.py
	install -Dm644 -t "$pkgdir/usr/share/doc/cvbasic/examples" examples/*
}
