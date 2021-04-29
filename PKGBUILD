# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Hipp <thomashipp at gmail dot com>

pkgname=dqlite
pkgver=1.7.0
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('LGPL3')
depends=('libuv' 'raft' 'sqlite')
makedepends=('tcl' 'readline' 'zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d974fde030f3b9c84ea82773c22548029bb33005651ca924cb5f066348c283a5')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i 
	#PKG_CONFIG_PATH="/usr/lib/sqlite-replication/pkgconfig" ./configure --prefix=/usr
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check || true
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
