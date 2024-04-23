# Maintainer: gbletr42 <gbletr42@gmail.com>
_pkgname="bef"
pkgname="bef-git"
pkgver=r5.e662748
pkgrel=1
pkgdesc="An extensible, fast, and usable file utility to encode and decode interleaved erasure coded streams of data."
arch=('i686' 'x86_64')
url="https://github.com/gbletr42/bef"
license=('GPL-3.0-or-later')
depends=('xxhash' 'openssl' 'zlib' 'liberasurecode' 'isa-l' 'jerasure-git' 'libblake3' 'cm256cc' 'openfec' 'wirehair' 'leopard')
makedepends=('git' 'automake' 'autoconf')
source=('git+https://github.com/gbletr42/bef.git')
sha256sums=('SKIP')
provides=(bef)
conflicts=(bef)

build() {
	cd $_pkgname
	autoreconf --install
	./configure --with-blake3 --with-zlib --with-openssl --with-liberasurecode --with-cm256cc --with-openfec --with-leopard --with-wirehair --prefix="/usr"
	make
}

package() {
	cd $_pkgname
	make install DESTDIR="$pkgdir"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
