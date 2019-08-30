# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=dqlite
pkgver=1.0.0
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('Apache')
depends=('libuv>=1.8.0' 'sqlite-replication>=3.22.0' 'raft' 'libco')
conflicts=('dqlite-git')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f68a04f41829e453831b6ce71840370b16e793c735a0ded291cba95b24f7f254')

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
