# Maintainer: Joakim Hulthe <joakim@hulthe.net>
pkgname=digiflisp
pkgver=1.08
pkgrel=2
pkgdesc="IDE for the FLIS processor and training computer"
arch=('x86_64')
url="http://www.cse.chalmers.se/edu/resources/software/index.html"
license=('Copyright 2012-2017, GMV')

makedepends=('libarchive')

source=(http://www.cse.chalmers.se/edu/resources/software/linux/$pkgname\_$pkgver\_amd64.deb)
md5sums=('d101ab1800625fd9ca5ac9d85f6342a3')
sha256sums=('03873dbdb97912a6dea9ebd73c2f1faf806d6b9ac36d682ef498adfcfd5e26aa')

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
