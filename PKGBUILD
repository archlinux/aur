# Maintainer: Sophie 'Sharky' Schumann <sharky@sharky.pw>
pkgname=nyancoin-qt
pkgver=1.3.2
pkgrel=3
pkgdesc="NyanCoin Qt5 wallet"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://reddit.com/r/NyanCoins"
license=('MIT')
depends=(boost-libs libdb-4.8 openssl miniupnpc qt5-base)
makedepends=(boost)
source=(
	"git+https://github.com/Nyancoins/nyancoin-client.git"
	"nyancoin-qt.desktop"
	"nyancoin-qt.png"
)
sha256sums=('SKIP'
	'81f414068fbb64502152975ec6f906ee6e0dc8728ade64cd1adecce2cb270258'
	'9e16d85cf7d7abe16c766b1898905e42fa1ed8c9a5e43d3bd7cf09e8d6f03593')
validpgpkeys=()

build() {
	cd "nyancoin-client"
	qmake \
		BDB_LIB_SUFFIX="" \
		BDB_LIB_PATH="/opt/BerkeleyDB-4.8/lib" \
		BDB_INCLUDE_PATH="/opt/BerkeleyDB-4.8/include"
	make
}

package() {
	cd "nyancoin-client"
	mkdir "$pkgdir/usr/bin" -p
	cp -v "Nyancoin-qt" "$pkgdir/usr/bin/"

	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

