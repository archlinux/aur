#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=libassl
pkgver=1.4.1
pkgrel=2
pkgdesc="Provides a much simpler and sane programming interface to OpenSSL"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/assl"
license=(ISC)

depends=('glibc')
makedepends=('libclens')

source=(https://opensource.conformal.com/snapshots/assl/assl-$pkgver.tar.gz)
sha1sums=('e3d05390e63ce122a3f6ee3a996fa4b0876f9db5')

build() {
	cd "assl-$pkgver"
	mkdir -p obj
	make LOCALBASE=/usr
}

package() {
	cd "assl-$pkgver"
	make LOCALBASE=/usr DESTDIR="$pkgdir" install

	cd "$pkgdir"
	mv usr/share/man/man3/assl.3 templocation
	rm usr/share/man/man3/*
	mv templocation usr/share/man/man3/libassl.3

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cat <<EOF >$pkgdir/usr/share/licenses/$pkgname/LICENSE
ISC
.
Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.
.
THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF MIND, USE, DATA OR PROFITS, WHETHER
IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
EOF
}
