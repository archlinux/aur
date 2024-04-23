# Maintainer: gbletr42 <gbletr42@gmail.com>
_pkgname="bef"
pkgname="bef-minimal"
pkgver=0.3.1
pkgrel=1
pkgdesc="An extensible, fast, and usable file utility to encode and decode interleaved erasure coded streams of data. Minimal Dependencies"
arch=('i686' 'x86_64')
url="https://github.com/gbletr42/bef"
license=('GPL-3.0-or-later')
depends=('xxhash')
makedepends=('automake' 'autoconf')
source=("${url}/archive/refs/tags/release-v${pkgver}.tar.gz")
sha256sums=('9fdc65d276984370e083dbc3c71872b30e2d35bddd3b5f4028153d6e70405f41')
provides=(bef)
conflicts=(bef)

build() {
	cd ${_pkgname}-release-v${pkgver}
	autoreconf --install
	./configure --prefix="/usr"
	make
}

package() {
	cd ${_pkgname}-release-v${pkgver}
	make install DESTDIR="$pkgdir"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
