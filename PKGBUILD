# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=sdif
pkgname=lib$_pkgbasename
pkgver=3.11.4
pkgrel=1
pkgdesc="Library to handle Sound Description Interchange Format (SDIF) files."
arch=('i686' 'x86_64')
url="http://sdif.sourceforge.net/"
license=('LGPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/$_pkgbasename//SDIF-$pkgver-src.zip")
sha256sums=('b1719b93babf13c6461f3db960cf383803dce274682bc284d9b6ac12405be531')

prepare() {
    mv "$srcdir/SDIF-$pkgver-src" "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"

    # Do not create examples.
    sed -i "s/examples test/test/g" Makefile.in
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}

