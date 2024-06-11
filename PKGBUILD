# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Sandor Nagy <sandor[dot]nagy[at]kdemail[dot]net>
pkgname=librcsc
pkgver=rc2023
pkgrel=1
pkgdesc="A base library to develop a simulated soccer team for the RoboCup Soccer Simulation"
arch=('x86_64')
url="https://github.com/helios-base/librcsc"
license=('LGPL-3.0-or-later')
depends=('bash' 'gcc-libs' 'glibc' 'zlib')
makedepends=('boost')
optdepends=('rcssserver: RCSS Server'
            'rcssmonitor: RCSS Monitor'
            'cppunit: C++ unit testing framework')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('377cd6bf366091eebb6863255bb5fb5dcc94e4f4bd085d4c67bd3c3db5fabb35')

build() {
	cd "$pkgname-$pkgver"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
