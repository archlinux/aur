# Contributor: Rudy Matela <rudy@matela.com.br>
# Maintainer: Rudy Matela <rudy@matela.com.br>
pkgname=pngcheck
pkgver=2.3.0
pkgrel=2
pkgdesc="Verifies the integrity of PNG, JNG and MNG files by checking the CRCs and decompressing the image data"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/apps/pngcheck.html"
license=('GPL')
depends=('libpng')
makedepends=('libpng')
source=("http://sourceforge.net/projects/png-mng/files/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz"
        'makefile.patch')
md5sums=('980bd6d9a3830fdce746d7fe3c9166ee' 'bd6f2e05f4914e9e271e3b844b489c40')

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
