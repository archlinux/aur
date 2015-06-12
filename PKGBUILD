# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: Stéphane Gaudreault <stephane.gaudreault@gmail.com>

pkgname=laspack
pkgver=1.12.2
pkgrel=2
pkgdesc="Package for solving large sparse systems of linear equations."
url="http://www.mgnet.org/mgnet/Codes/laspack/html/laspack.html"
license="GPL"
arch=('i686' 'x86_64')
source=("http://www.netlib.org/linalg/$pkgname.tgz")
md5sums=('fcfb3c86cc993e29eb477191b1136a8d')
options=('staticlibs')

build() {
    cd "$srcdir/$pkgname"
    sed -i "s|/usr/local|$pkgdir/usr|g" makefile
    make

    cd "$srcdir/xc"
    sed -i "s|/usr/local|$pkgdir/usr|g" makefile
    make
}

package() {
    mkdir -p ${pkgdir}/usr/{include,lib}

    cd "$srcdir/$pkgname"
    make install-local

    cd "$srcdir/xc"
    make install-local
}
