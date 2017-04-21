# Maintainer:  Eric Biggers <ebiggers3@gmail.com>

pkgname=libdeflate-git
pkgver=0.7.r2.g671e2bb
pkgrel=1
pkgdesc='Heavily optimized library for DEFLATE/zlib/gzip (de)compression'
arch=('i686' 'x86_64')
url='https://github.com/ebiggers/libdeflate'
license=('MIT')
depends=('glibc')
source=('git+https://github.com/ebiggers/libdeflate.git')
sha256sums=('SKIP')
conflicts=('libdeflate')
provides=('libdeflate')
replaces=('libdeflate')

pkgver() {
	cd libdeflate
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd libdeflate
	make
}

package() {
	cd libdeflate

	install -Dm755 gzip "$pkgdir/usr/bin/libdeflate-gzip"
	ln "$pkgdir/usr/bin/libdeflate-gzip" "$pkgdir/usr/bin/libdeflate-gunzip"

	install -Dm755 libdeflate.so "$pkgdir/usr/lib/libdeflate.so"
	install -Dm644 libdeflate.h "$pkgdir/usr/include/libdeflate.h"
	install -Dm644 libdeflate.a "$pkgdir/usr/lib/libdeflate.a"

	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README* NEWS
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
