# Maintainer: Joakim Hulthe <joakim@hulthe.net>
pkgname=digiflisp
pkgver=1.10
pkgrel=1
pkgdesc="IDE for the FLIS processor and training computer"
arch=('x86_64')
url="http://www.gbgmv.se/html/digiflisp.html"
license=('Copyright 2012-2020, GMV')

makedepends=('libarchive')

source=(http://www.gbgmv.se/dl/software/linux/$pkgname\_$pkgver\_amd64.deb)
md5sums=('f7119d576e021bdaf90e67637da6a539')
sha256sums=('25bccc1e2c40e9b9ad824434f4003e8f62eb33adc5ff97b246cc9c97d97cb66e')

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
