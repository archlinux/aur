# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=raft
pkgver=0.9.3
pkgrel=1
pkgdesc="C implementation of the Raft consensus protocol"
arch=('x86_64')
url="https://github.com/canonical/raft"
license=('Apache')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d73fd6e9ef9c36a519262f266d1f5003567dfe2eaa3e3c612cdbdb3d225a8bb7')

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
