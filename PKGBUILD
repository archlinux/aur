# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=raft
pkgver=0.9.5
pkgrel=1
pkgdesc="C implementation of the Raft consensus protocol"
arch=('x86_64')
url="https://github.com/canonical/raft"
license=('Apache')
depends=('libuv>=1.8.0')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1f8e2530462546b39e5915c49b66ece41770fc40e7b1e537cf7a7fadabb5a87d')

build() {
	cd "${pkgname}-${pkgver}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
