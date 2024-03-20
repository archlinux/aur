# Maintainer: gbletr42 <gbletr42@gmail.com>
pkgname="bef"
pkgver=0.2.2
pkgrel=1
pkgdesc="An extensible, fast, and usable file utility to encode and decode interleaved erasure coded streams of data."
arch=('i686' 'x86_64')
url="https://github.com/gbletr42/bef"
license=('GPL-3.0-or-later')
depends=('xxhash' 'openssl' 'zlib' 'liberasurecode' 'isa-l' 'jerasure-git' 'libblake3')
makedepends=('automake' 'autoconf')
source=("${url}/archive/refs/tags/release-v${pkgver}.tar.gz")
sha256sums=('ddadf122076d7142481ff1b60ab611a9f58455285b9561d777bdbce9bb8bf4d2')

build() {
	cd ${pkgname}-release-v${pkgver}
	autoreconf --install
	./configure --with-liberasurecode --with-zlib --with-blake3 --with-openssl --prefix="/usr"
	make
}

package() {
	cd ${pkgname}-release-v${pkgver}
	make install DESTDIR="$pkgdir"

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
