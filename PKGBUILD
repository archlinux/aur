# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: nisk1

pkgname=asap
pkgver=8.0.0
pkgrel=1
pkgdesc="Player of Atari 8-bit chiptunes for modern computers"
url="http://asap.sourceforge.net"
arch=('x86_64')
license=('GPL-2.0-only')
source=(
	"https://downloads.sourceforge.net/asap/${pkgname}-${pkgver}.tar.gz"
	"cflags_ldflags_append.patch"
)
sha256sums=('062d7db2a0747bf9200560141452f8fa2289909b147ac40a5bb5b60d5275a14f'
            '1c17f996fe616daa4dc14eabb20f3e58546873aab24abe7dcb1f27edc90fbd5c')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 < ../cflags_ldflags_append.patch
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix="/usr" install
}
