# Contributor: Rudy Matela <rudy@matela.com.br>
# Maintainer: Rudy Matela <rudy@matela.com.br>
pkgname=pngcheck
pkgver=4.0.0
pkgrel=3
pkgdesc="Verifies the integrity of PNG, JNG and MNG files"
arch=('x86_64')
url="https://github.com/pnggroup/pngcheck"
# previously: http://www.libpng.org/pub/png/apps/pngcheck.html
license=('GPL-2.0-only OR X11')
depends=('libpng')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pnggroup/pngcheck/archive/refs/tags/v4.0.0.tar.gz")
sha256sums=('ed13f49bc1205bdf7cd0fc208b6e0eef550da021d1631f7180f718a4db379398')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	# cp Makefile.unx Makefile
	# 4.0.0 produces several warnings when compiled under GHC 15
	sed -e 's/-Werror //' Makefile.unx >Makefile
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
