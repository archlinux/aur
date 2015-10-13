# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=libtmx
provides=('libtmx')
pkgver=0.10.2
pkgrel=1
pkgdesc="Loads .tmx tiled maps in your games."
arch=(any)
url="https://github.com/baylej/tmx/"
license=('BSD')
depends=('zlib' 'libxml2')
makedepends=('cmake')
source=("tmx-tmx_${pkgver}.tar.gz::https://github.com/baylej/tmx/archive/tmx_${pkgver}.tar.gz")
sha512sums=('4cfe0e04b23511a6d7541038f8b7852d05dacae882bd4e97ca97dd8884a42c7c1fd921782301ce90d2b937638b2f7f02f91ca0fb02c8d0be8ac602749484e0e8')

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
