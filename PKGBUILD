# Maintainer: subnex <slimed13 at hotmail dot com>

pkgname=savi-dev
pkgver=r216
pkgrel=1
pkgdesc="SaVi simulates satellite orbits and coverage, in two and three dimensions. SaVi lets you explore satellite constellations."
arch=('x86_64')
license=('custom:The National Science and Technology Research Center for Computation and Visualization of Geometric Structures (The Geometry Center) University of Minnesota')
url="https://savi.sourceforge.io/"

conflicts=('savi')
depends=('tcl' 'tk')

optdepends=('lynx' 'gifsicle' 'geomview' 'netpbm' 'zlib')

makedepends=('subversion')

source=("svn+https://svn.code.sf.net/p/savi/savi-dev/")

md5sums=(SKIP)


pkgver(){
    cd "$pkgname"
    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}" 
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
	make ARCH=linux
}


package() {

	DESTDIR=$pkgdir
	mkdir -p "$DESTDIR/opt" "$DESTDIR/usr/bin/"
	cp -r "$pkgname" $DESTDIR/opt
	cp $DESTDIR/opt/$pkgname/savi $DESTDIR/usr/bin/savi
	cd $DESTDIR/usr/bin
	sed -i "s/SAVI=\$(cd.*/SAVI=\/opt\/$pkgname/g" savi
}

