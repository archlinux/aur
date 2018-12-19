# Maintainer: Adrian Hühn <adrian.huehn@web.de>
# Previous Maintainer: Vit <vitruss@gmail.com>

pkgname=xcrysden
pkgver=1.5.60
pkgrel=1
epoch=
pkgdesc="crystalline and molecular structure visualisation program"
arch=('x86_64')
url="http://www.xcrysden.org/"
license=('GPL2')
depends=('tk' 'tcl' 'gl2ps' 'fftw' 'bwidget' 'imagemagick' 'gcc-fortran' 'glu' 'libxmu')
replaces=('xcrysden-bin')
source=("http://www.xcrysden.org/download/xcrysden-${pkgver}.tar.gz"
        "fix-xcrysden-install.patch"
		"Make.sys")
sha256sums=('a695729f1bb3e486b86a74106c06a392c8aca048dc6b0f20785c3c311cfb2ef4'
	    	'61a0bbc7728beff05bcb7f1676053de468ebb926b638869174aa2bbcb5bc554c'  
	    	'077ca35a6d7264c0b13489a3c06cb49041c6afaf394d136c303ba9b4a5614d66')


prepare() {
	mv Make.sys "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	patch -p1 -i $srcdir/fix-xcrysden-install.patch
}

build() {
	cd "$pkgname-$pkgver"
	make xcrysden
}

package() {
	cd "$pkgname-$pkgver"
	prefix=$pkgdir/usr make install
}
