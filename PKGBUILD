# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=sdif
pkgname=lib32-lib$_pkgbasename
pkgver=3.11.4
pkgrel=1
pkgdesc="Library to handle Sound Description Interchange Format (SDIF) files. (32 bit)"
arch=('x86_64')
url="http://sdif.sourceforge.net/"
license=('LGPL')
depends=('lib32-glibc')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/$_pkgbasename/SDIF-$pkgver-src.zip")
sha256sums=('b1719b93babf13c6461f3db960cf383803dce274682bc284d9b6ac12405be531')

prepare() {
    mv "$srcdir/SDIF-$pkgver-src" "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"

    # Do not create examples.
    sed -i "s/examples test/test/g" Makefile.in
}

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}/usr"/{bin,include,share}
}

