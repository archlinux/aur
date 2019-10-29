# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=dqlite
pkgver=1.0.1
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('Apache')
depends=('libuv>=1.8.0' 'sqlite-replication>=3.22.0' 'raft' 'libco')
conflicts=('dqlite-git')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('42d0684523728f169a8024cbd9cd1909b2a6a5ba5c62d8903625bd4c61c79cf8')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
