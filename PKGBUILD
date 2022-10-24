# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=bzip3
pkgver=1.1.7
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
sha256sums=('496e0192459f53e397472e5f7281091889e1059d7183b778e01b09d3aaa1d249')

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
