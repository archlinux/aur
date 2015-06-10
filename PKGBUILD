# Maintainer:  jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=libbassenc
pkgver=2.4.12.8
pkgrel=1
pkgdesc="An extension that allows BASS channels to be encoded using command-line encoders with STDIN support."
arch=('i686' 'x86_64')
url="http://www.un4seen.com/bass.html#addons"
license=('custom:basslicence')
depends=('libbass')
makedepends=('unzip')
# provides=('')
# conflicts=('')
source=('http://us.un4seen.com/files/bassenc24-linux.zip' 'LICENSE')
md5sums=('a554085402c6d668eabf678f8dec4e24'
	 '9ba933735ead25f00741f2e6d3abed05')


package() {

	mkdir -p "$pkgdir/usr/lib/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	mkdir -p "$pkgdir/usr/include"

	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/bassenc.chm" "$pkgdir/usr/share/doc/$pkgname"

    	msg2 "  -> Installing program..."
	
	[ "$CARCH" == i686 ] && install -Dm755 "$srcdir/$pkgname.so" "$pkgdir/usr/lib/"

	[ "$CARCH" == x86_64 ] && install -Dm755 "$srcdir/x64/$pkgname.so" "$pkgdir/usr/lib/"

	cp "$srcdir/bassenc.h" "$pkgdir/usr/include"	# I assume this is where it goes...

	# and just in case...

	chmod -R 755 "$pkgdir/usr/lib/$pkgname.so"
	chmod -R 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod -R 644 "$pkgdir/usr/share/doc/$pkgname/bassenc.chm"
	chmod -R 644 "$pkgdir/usr/include/bassenc.h"

}

# vim: ts=2 sw=2 et: