# Maintainer:  LIN Ruoshui <LinRs@yandex.com>

pkgname=libbassmidi
pkgver=2.4.11
pkgrel=1
pkgdesc="An extension enabling the playback of MIDI files and custom event sequences."
arch=('i686' 'x86_64')
url="http://www.un4seen.com/bass.html#addons"
license=('custom:basslicence')
depends=('libbass')
makedepends=('unzip')
# provides=('')
# conflicts=('')
source=('http://www.un4seen.com/files/bassmidi24-linux.zip' 'LICENSE')
sha512sums=('12380ab5e8daa3d7240ea18118b2a6da002d0d1edc72a263da2538436b327870657d4770d6dd14772be9eb38758ac22f61f2f79f8fef7c3a75445f26aad1ad60'
            '0010ec376b29b12c15ea182675dcec6fad3219abc605e8f7b14b5e05957e68ef6a87ab13b70ea5ba80b72f030185fdd426a6ffd90d0c1c6ab716a2f12c4056a9')


package() {

	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	mkdir -p "$pkgdir/usr/include"

	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/bassmidi.chm" "$pkgdir/usr/share/doc/$pkgname"

    	msg2 "  -> Installing program..."
	
	[ "$CARCH" == i686 ] && install -Dm755 "$srcdir/$pkgname.so" "$pkgdir/usr/lib/"

	[ "$CARCH" == x86_64 ] && install -Dm755 "$srcdir/x64/$pkgname.so" "$pkgdir/usr/lib/"

	cp "$srcdir/bassmidi.h" "$pkgdir/usr/include"	# I assume this is where it goes...

	# and just in case...

	chmod -R 755 "$pkgdir/usr/lib/$pkgname.so"
	chmod -R 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod -R 644 "$pkgdir/usr/share/doc/$pkgname/bassmidi.chm"
	chmod -R 644 "$pkgdir/usr/include/bassmidi.h"

}

# vim: ts=2 sw=2 et:
