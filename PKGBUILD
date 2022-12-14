# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Hipp <thomashipp at gmail dot com>

pkgname=dqlite
pkgver=1.13.0
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('LGPL3')
depends=('libuv' 'raft' 'sqlite')
makedepends=('tcl' 'readline' 'zlib')
options=(debug strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('14334a72389322d047576697f112da4cd6e1a5257d652d6162f195f2855fcd12')

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
