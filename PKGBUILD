# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=bzip3
pkgver=1.1.1
pkgrel=1
pkgdesc='A better and stronger spiritual successor to BZip2'
arch=(x86_64)
license=(LGPL3)
url="https://github.com/kspalaiologos/$pkgname"
depends=(glibc)
provides=(libbzip3.so)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('1262ebfa6a531dede3543d14efd14813d067cfc4c720c0998dc2f1243ccd08b0')

prepare() {
	cd "$_archive"
	./bootstrap.sh
}

build() {
	cd "$_archive"
	./configure --prefix /usr
	make all
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
