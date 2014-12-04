#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=libshrink
pkgver=0.5.4
pkgrel=3
pkgdesc="Library provides a single API into several compression algorithms (LZO, LZ77, LZMA)"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/shrink"
license=(ISC)

depends=('zlib' 'lzo>=2.0' 'xz')
makedepends=('libclens')

source=(https://opensource.conformal.com/snapshots/shrink/shrink-$pkgver.tar.gz)
sha1sums=('e6f71d477e1550cc7b683e878b471c665ade692a')

build() {
	cd "shrink-$pkgver"
	mkdir -p $pkgname/obj
	make -C $pkgname LOCALBASE=/usr
}

package() {
	cd "shrink-$pkgver"
	make -C $pkgname LOCALBASE=/usr DESTDIR="$pkgdir" install

	cd "$pkgdir"
	mv usr/share/man/man3/shrink.3 usr/share/man/man3/libshrink.3
	chmod 755 usr/lib/libshrink.so.3.0

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
