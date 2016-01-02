# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=libtmx
provides=('libtmx')
pkgver=0.13.1
pkgrel=1
pkgdesc="Loads .tmx tiled maps in your games."
arch=(any)
url="https://github.com/baylej/tmx/"
license=('BSD')
depends=('zlib' 'libxml2')
makedepends=('cmake')
source=("tmx-tmx_${pkgver}.tar.gz::https://github.com/baylej/tmx/archive/tmx_${pkgver}.tar.gz")
sha512sums=('26d1d422f3195efdfa06a41430f0e1355fc0eb79efa712fbd9480cf2fa54c9170592831871eb6300349115f37ee36c52dd004e570b0132e2ab8e2f6d4c55ec57')

build() {
	cd ${srcdir}/tmx-tmx_${pkgver}
	cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${srcdir}/tmx-tmx_${pkgver}
	make DESTDIR="$pkgdir" install
	install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
