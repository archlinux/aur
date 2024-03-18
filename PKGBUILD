# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=http-parser
pkgver=2.9.4
pkgrel=2
pkgdesc='Parser for HTTP Request/Response written in C'
arch=(x86_64)
url="https://github.com/nodejs/http-parser"
license=(MIT)
depends=(glibc)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('467b9e30fd0979ee301065e70f637d525c28193449e1b13fbcb1b1fab3ad224f')

prepare() {
	cd "$_archive"
	sed -i 's|-Werror||' Makefile
}

build() {
	cd "$_archive"
	make library
}

check() {
	cd "$_archive"
	make test
}

package() {
	cd "$_archive"
	make PREFIX="$pkgdir/usr" install
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT 
}
