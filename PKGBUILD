# Maintainer: subnex <slimed13 at hotmail dot com>

pkgname=savi
pkgver=1.6.0
pkgrel=1
pkgdesc="SaVi simulates satellite orbits and coverage, in two and three dimensions. SaVi lets you explore satellite constellations."
arch=('x86_64')
license=('custom:The National Science and Technology Research Center for Computation and Visualization of Geometric Structures (The Geometry Center) University of Minnesota')
url="https://savi.sourceforge.io/"

depends=('tcl' 'tk')

optdepends=('lynx' 'gifsicle' 'geomview' 'netpbm' 'zlib')

conflicts=('savi-dev')

source=("https://savi.sourceforge.io/download/$pkgname$pkgver-release.tar.gz")

md5sums=('8c0e8203c09d992991384d8644c68029')

build() {
	cd "$pkgname$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
	make ARCH=linux
}


package() {

	DESTDIR=$pkgdir
	mkdir -p "$DESTDIR/opt" "$DESTDIR/usr/bin/"
	cp -r "$pkgname$pkgver" $DESTDIR/opt
	cp $DESTDIR/opt/$pkgname$pkgver/savi $DESTDIR/usr/bin/savi
	cd $DESTDIR/usr/bin
	sed -i "s/SAVI=\$(cd.*/SAVI=\/opt\/$pkgname$pkgver/g" savi
}

