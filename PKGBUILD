# Maintainer: Joakim Hulthe <joakim@hulthe.net>
pkgname=digiflisp
pkgver=2.03
pkgrel=1
pkgdesc="IDE for the FLIS processor and training computer"
arch=('x86_64')
url="http://www.gbgmv.se/html/digiflisp.html"
license=('Copyright 2012-2020, GMV')

makedepends=('libarchive')

source=(http://www.gbgmv.se/dl/linux/$pkgname\_$pkgver\_amd64.deb)
md5sums=('9dd35b560ba1b000ded00a3e665259f0')
sha256sums=('1b67099625e2d09b57e838eccda03ffeca88bb4b7273d9c30724daa79494d110')

prepare() {
	msg2 "Unpacking .deb"
	cd $srcdir
	bsdtar -xf data.tar.xz
}

package() {
	msg2 "Moving stuff in place"
	install -Dm755 "$srcdir/usr/share/digiflisp/digiflisp" \
	               "$pkgdir/usr/share/digiflisp/digiflisp"

	install -Dm755 "$srcdir/usr/share/digiflisp/digiflisp.png" \
	               "$pkgdir/usr/share/digiflisp/digiflisp.png"

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
