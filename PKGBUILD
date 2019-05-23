# Maintainer: Sophie 'Sharky' Schumann <sharky@sharky.pw>
pkgname=nyancoin-qt
pkgver=1.3.2
pkgrel=2
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
md5sums=('SKIP'
         'f5ec718a29bcd8419c5aafe1b4e210b5'
         '1a235ccadeff05eb3422027e3fb610ba')
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

