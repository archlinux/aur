# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: nisk1

pkgname=asap
pkgver=5.1.0
pkgrel=3
pkgdesc="Player of Atari 8-bit chiptunes for modern computers"
url="http://asap.sourceforge.net"
arch=('x86_64')
license=('GPL2')
source=(
	"https://downloads.sourceforge.net/asap/${pkgname}-${pkgver}.tar.gz"
	"cflags_ldflags_append.patch"
)
sha256sums=('ec881c6894d00e669e25a9c22f7ceae38ea65bd6240ec00d0a4f475c13b642b0'
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
