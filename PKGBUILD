# Maintainer: Joakim Hulthe <joakim@hulthe.net>
pkgname=digiflisp
pkgver=1.04
pkgrel=1
pkgdesc="IDE for the FLIS processor and training computer"
arch=('x86_64')
url="http://www.cse.chalmers.se/edu/resources/software/index.html"
license=('Copyright 2012-2017, GMV')

#depends=()
makedepends=('libarchive')

source=(http://www.cse.chalmers.se/edu/resources/software/linux/debian9/$pkgname\_$pkgver\_amd64.deb)
md5sums=('40ddcb9faf90a0baf4451680bf38562b')
sha256sums=('8a2fa750a3cfbe413454dd7311b2a6261d6da3c834e93685438d966ce8caf727')

prepare() {
	msg2 "Unpacking .deb"
	cd $srcdir
	bsdtar -xf data.tar.xz
}

package() {
	msg2 "Moving stuff in place"
	install -Dm755 "$srcdir/usr/share/digiflisp/digiflisp" \
	               "$pkgdir/usr/share/digiflisp/digiflisp"

	install -Dm755 "$srcdir/usr/share/digiflisp/qaflisp" \
	               "$pkgdir/usr/share/digiflisp/qaflisp"
	
	install -Dm644 "$srcdir/usr/share/applications/digiflisp.desktop" \
	               "$pkgdir/usr/share/applications/digiflisp.desktop"
	
	install -Dm644 "$srcdir/usr/share/doc/digiflisp/changelog.gz" \
	               "$pkgdir/usr/share/doc/digiflisp/changelog.gz"

	install -Dm644 "$srcdir/usr/share/doc/digiflisp/copyright" \
	               "$pkgdir/usr/share/doc/digiflisp/copyright"

	msg2 "Creating symlinks"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/share/digiflisp/digiflisp" "$pkgdir/usr/bin/digiflisp"
	ln -s "/usr/share/digiflisp/qaflisp"   "$pkgdir/usr/bin/qaflisp"
}
