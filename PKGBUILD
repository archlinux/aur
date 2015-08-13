# Maintainer: Raansu <Gero3977@gmail.com>
# Contributor: Moritz Heidkamp <moritz@twoticketsplease.de>
pkgname=chunksync
pkgver=0.3
pkgrel=1
pkgdesc="An incremental backup program, especially suited for encrypted disks."
arch=(i686 x86_64)
url="http://chunksync.florz.de/"
license=(custom)
depends=(openssl)
makedepends=(perl)
optdepends=(chunkfs)
provides=(chunksync)
conflicts=(chunksync)
source=(http://chunksync.florz.de/chunksync_${pkgver}.tar.gz LICENSE)
sha256sums=('e0c27f925c5cf811798466312a56772864b633728c433fb2fcce23c8712b52fc'
            '30b7bcf5380a107e9508394efd22ef46281abfd7ef1abc5ad39d1d1583423e77')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

