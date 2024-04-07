# Maintainer: gbletr42 <gbletr42@gmail.com>
pkgname="bef"
pkgver=0.3.0
pkgrel=1
pkgdesc="An extensible, fast, and usable file utility to encode and decode interleaved erasure coded streams of data."
arch=('i686' 'x86_64')
url="https://github.com/gbletr42/bef"
license=('GPL-3.0-or-later')
depends=('xxhash' 'openssl' 'zlib' 'liberasurecode' 'isa-l' 'jerasure-git' 'libblake3' 'cm256cc' 'openfec' 'wirehair' 'leopard')
makedepends=('automake' 'autoconf')
source=("${url}/archive/refs/tags/release-v${pkgver}.tar.gz")
sha256sums=('2cba42a2a8d57f463614239f4a10983d6f8b7c9a4f29716d6a31018693684d9f')

build() {
	cd ${pkgname}-release-v${pkgver}
	autoreconf --install
	./configure --with-blake3 --with-zlib --with-openssl --with-liberasurecode --with-cm256cc --with-openfec --with-leopard --with-wirehair --prefix="/usr"
	make
}

package() {
	cd ${pkgname}-release-v${pkgver}
	make install DESTDIR="$pkgdir"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
