# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=raft
pkgver=0.9.16
pkgrel=1
pkgdesc="C implementation of the Raft consensus protocol"
arch=('x86_64')
url="https://github.com/canonical/raft"
license=('Apache')
depends=('libuv>=1.8.0')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b4c4ac15dd74a4c2bbe86149cb5fc1b937979a62e97439615175e3e218fac512')

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
