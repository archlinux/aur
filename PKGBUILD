# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail [dt] com >
pkgname=libsufr
pkgver=0.6.5
pkgrel=1
pkgdesc="A LIBrary containing Some Useful Fortran Routines"
arch=('i686' 'x86_64')
url="http://libsufr.sourceforge.net/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake' 'gcc-fortran')
changelog=ChangeLog
source=("http://sourceforge.net/projects/libsufr/files/$pkgname-$pkgver.tar.gz")
sha512sums=('748b7200d36be19763eea830ca57a530a1dc2b17e1ae988c76b1028fe13e4522cef13b47a38a24b5e6428d6b37d2d5a77b091eb3ce51a33fe92a2703a8ec7204')

build() {
	mkdir -p "$pkgname-$pkgver"/build
	cd "$pkgname-$pkgver"/build/
	cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..
	make
}

package() {
	# Install library:
	cd "$pkgname-$pkgver"/build/
	make install
	
	# Install man pages:
	mkdir -p ${pkgdir}/usr/share/man/man3/
	cd ../man/
	gzip -9 *
	cp * ${pkgdir}/usr/share/man/man3/
}
