# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=bzip3
pkgver=1.1.7_a
pkgrel=1
pkgdesc='A better and stronger spiritual successor to BZip2'
arch=(x86_64)
license=(LGPL3)
url="https://github.com/kspalaiologos/$pkgname"
depends=(glibc)
makedepends=(clang)
provides=(libbzip3.so)
_archive="$pkgname-${pkgver/_/}"
source=("$url/releases/download/${pkgver/_/}/$_archive.tar.xz")
sha256sums=('d5511d09cc5a902886807b9236ed455e6336efd3006fec3098fc43f36119b3a7')

build() {
	cd "$_archive"
	./configure --prefix /usr CC=clang
	make all
}

check() {
	cd "$_archive"
	make check
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
