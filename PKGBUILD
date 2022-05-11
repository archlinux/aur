# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=bzip3
pkgver=1.0.1
pkgrel=1
pkgdesc='A better and stronger spiritual successor to BZip2'
arch=(x86_64)
license=(LGPL3)
url="https://github.com/kspalaiologos/$pkgname"
depends=(glibc)
provides=(libbzip3.so)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('f3d871ff543566f9c5a37ff6d3dbd13f5f0913af2f563a97e2227ad3454c6844')

prepare() {
	cd "$_archive"
	# Also note gross hack with PREFIX below passing -t flag
	sed -i -e '/install/s/-m/-Dm/' Makefile
}

build() {
	cd "$_archive"
	CFLAGS+=" -Iinclude"
	make all
}

package() {
	cd "$_archive"
	make PREFIX="-t $pkgdir/usr" install
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
