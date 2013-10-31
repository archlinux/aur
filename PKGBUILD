#Maintainer: Dan Ziemba <zman0900@gmail.com>

pkgname=libexude
pkgver=0.7.3
pkgrel=2
pkgdesc="A simple to use memory debugger"
arch=(i686 x86_64)
url="https://opensource.conformal.com/wiki/exude"
license=(ISC)

depends=('glibc')
makedepends=('libclens' 'libclog' 'libbsd')

source=(https://opensource.conformal.com/snapshots/exude/exude-$pkgver.tar.gz)
sha1sums=('90064deb9e6c0f98f72ed5c52acba074aa6d20f4')

build() {
	cd "exude-$pkgver"
	mkdir -p obj
	export INCFLAGS=-idirafter/usr/include/bsd
	make LOCALBASE=/usr
}

package() {
	cd "exude-$pkgver"
	make LOCALBASE=/usr DESTDIR="$pkgdir" install

	cd "$pkgdir"
	mv usr/share/man/man3/exude.3 usr/share/man/man3/libexude.3
	chmod 755 usr/lib/libexude.so.3.1

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
