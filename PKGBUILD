# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=raft
pkgver=0.9.6
pkgrel=1
pkgdesc="C implementation of the Raft consensus protocol"
arch=('x86_64')
url="https://github.com/canonical/raft"
license=('Apache')
depends=('libuv>=1.8.0')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('703e29467b3775b9ab0d3778f4283232f2303179defdf26baa890f356712a2ef')

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
