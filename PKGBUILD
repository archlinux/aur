# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=bzip3
pkgver=1.1.3
pkgrel=1
pkgdesc='A better and stronger spiritual successor to BZip2'
arch=(x86_64)
license=(LGPL3)
url="https://github.com/kspalaiologos/$pkgname"
depends=(glibc)
makedepends=(clang)
provides=(libbzip3.so)
_archive="$pkgname-$pkgver"
source=("$url/releases/download/$pkgver/$_archive.tar.xz")
sha256sums=('9ee90e5b07a81e581515a89e263917f1738d8d28dbec05b3ded4524c79977c3c')

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
