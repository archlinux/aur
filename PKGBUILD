# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=dqlite
pkgver=0.2.6
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('Apache')
depends=('libuv>=1.8.0' 'sqlite-replication>=3.22.0')
source=("https://github.com/CanonicalLtd/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('47d31550d970a12d25101c331896cfb855128c110d912f5da3371062d9ece52b')

prepare() {
	cd "$pkgname-$pkgver"
}

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
