# Maintainer: doclic <doclic@tutanota.com>

pkgname=asm6
pkgver=1.6
pkgrel=2
pkgdesc='A 6502 assembler'
arch=('i486' 'i686' 'pentium4' 'x86_64')
url="https://3dscapture.com/NES/"
# Quote from the README.TXT:
# "This is free software.  You may use, modify, and / or redistribute any part
# of this software in any fashion.
license=("custom:$pkgname")
# No dependencies since we only need GNU build tools & glibc, which are part of
# base/base-devel
source=('https://3dscapture.com/NES/asm6.zip')
sha512sums=('1cd32d8e4f2e58a1263c77d5a38bfb069e2ed087cf5186dee2d4e6c9796c9cf93905a7ab5d834ff7d03b935f805e7e854d1069c5d1b6a22ee36138bda754c6ea')

prepare() {
	cd "$srcdir"
	sed -n '/^This is free software./,/any fashion.$/p' README.TXT > LICENSE
	rm -f asm6.exe
}

build() {
	${CC:-gcc} $CFLAGS $LDFLAGS -oasm6 asm6.c
}

package() {
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.TXT -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm755 asm6 -t "$pkgdir/usr/bin/"
}
