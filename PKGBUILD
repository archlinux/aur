pkgname=libpostal
pkgver=1.1.4
pkgrel=1
pkgdesc="A C library for parsing/normalizing street addresses around the world"
url="https://github.com/openvenues/libpostal"
license=("MIT")
source=("https://github.com/openvenues/libpostal/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41ad2cd20261e6498f1843c8d21cd737470d17e975deb6ea2a5d1517880729d3')
arch=("x86_64" "aarch64")
install="$pkgname.install"

case "$CARCH" in
	x86*) _sse2="" ;;
	*) _sse2="--disable-sse2" ;;
esac

build() {
	cd $pkgname-$pkgver

	./bootstrap.sh
	./configure --disable-data-download --prefix=/usr --datadir=/usr/local/share $_sse2

	make
}

package() {
	cd $pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
