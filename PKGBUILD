# Contributor: Rudy Matela <rudy@matela.com.br>
# Maintainer: Rudy Matela <rudy@matela.com.br>
pkgname=pngcheck
pkgver=3.0.0
pkgrel=1
pkgdesc="Verifies the integrity of PNG, JNG and MNG files by checking the CRCs and decompressing the image data"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/apps/pngcheck.html"
license=('GPL')
depends=('libpng')
makedepends=('libpng')
source=("http://www.libpng.org/pub/png/src/${pkgname}-${pkgver}.tar.gz"
        'makefile.patch')
sha1sums=('dcbac8be6732488127c40d241ce3ad706e91f2d0'
          '9962811ea70e6869ffb11515b70b9ccd0bf460ed')
sha256sums=('c6cc37b0d3638a79fcab458ba42ad599131056bfa5001dabdc01e44f1ef99302'
            '15660da01a14f29b6382d8efa533c08af0ff206346e7e974754c1d97ed4f3dd8')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	cp Makefile.unx Makefile
	patch -p0 < $srcdir/makefile.patch
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -Dm755 pngcheck $pkgdir/usr/bin/pngcheck
	install -Dm755 pngsplit $pkgdir/usr/bin/pngsplit
	install -Dm755 png-fix-IDAT-windowsize $pkgdir/usr/bin/png-fix-IDAT-windowsize
}
