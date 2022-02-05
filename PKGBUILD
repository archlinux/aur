pkgname=libpostal
pkgver=1.1
pkgrel=1
pkgdesc="A C library for parsing/normalizing street addresses around the world"
url="https://github.com/openvenues/libpostal"
license=("MIT")
source=("https://github.com/openvenues/libpostal/archive/refs/tags/v1.1.tar.gz")
sha256sums=('8cc473a05126895f183f2578ca234428d8b58ab6fadf550deaacd3bd0ae46032')
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
