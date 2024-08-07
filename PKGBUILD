# Maintainer: Mike H Benton <bikepunk005 at hotmail dot com>
# Contributor: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=libtmx
provides=('libtmx')
pkgver=1.10.0
pkgrel=2
pkgdesc="A portable C library to load tiled maps in your games."
arch=(any)
url="https://github.com/baylej/tmx/"
license=('BSD')
depends=('zlib' 'libxml2' 'zstd')
makedepends=('cmake')
CFLAGS+=" -ffat-lto-objects"
source=("tmx-tmx_${pkgver}.tar.gz::https://github.com/baylej/tmx/archive/tmx_${pkgver}.tar.gz")
b2sums=('2c88a77597624d90fc27b29f717a2ffe871e0516ad951e5aa10ebec8763836aeabc483214c7ff6ad4d821b53ff0fc4ad220c5b910ce08780f11b68e00c9ff0ef')
build() {
	cd ${srcdir}/tmx-tmx_${pkgver}
	cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=no -DWANT_ZLIB=yes -DWANT_ZSTD=yes -DZSTD_PREFER_STATIC=no  .
	make
}

package() {
	cd ${srcdir}/tmx-tmx_${pkgver}
	make DESTDIR="$pkgdir" install
	install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
