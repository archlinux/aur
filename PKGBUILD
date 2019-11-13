# Maintainer: Thomas Hipp <thomashipp at gmail dot com>
pkgname=dqlite
pkgver=1.1.0
pkgrel=1
pkgdesc="Distributed SQLite"
arch=('x86_64')
url="https://github.com/CanonicalLtd/dqlite"
license=('Apache')
depends=('libuv>=1.8.0' 'sqlite-replication>=3.22.0' 'raft' 'libco')
conflicts=('dqlite-git')
source=("https://github.com/canonical/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b03ad557a461beed90cd3d6c13fb9cceb35cdf686fb9b7a5c6db7fd3e7950563')

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
