# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgname=litecoinhd-qt
pkgver=0.16.6
pkgrel=1
commit=fb64d89
arch=('x86_64')
url="https://ltchd.io"
license=('MIT')
source=("https://github.com/ltchd2019/$pkgname/releases/download/ltchd-v$pkgver/ltchd-v$pkgver.0-$commit-x86_64-linux-gnu.tar.gz"
        "https://raw.githubusercontent.com/ltchd2019/$pkgname/ltchd-v$pkgver/COPYING"
        "litecoinhd128.png"
        "litecoinhd-qt.desktop"
        "lhd-qt.sh")
noextract=('COPYING')
sha256sums=('c2f1a6cb8b114f2d0a6e169b52e2f2fba2c06d95ecefe776d51a60972529d205'
            'e4c2b5dd7474e599e958324fd4eb47aa67aad650e73e39e8358df2907d4af386'
            '2630ae1bfc1393f279dcbae517ff1e90e4bdc8e7fe652f7429f6231ad9af6730'
            'd990b06d30aae8c633f36fda986015921f33a9b7a326da0b471f8daa739e4fc4'
            'fb1aec170fb65a89f8c6bbef0f70568c70d2ba8d54d18f7dd3650144bff13f6b')

package() {
	pkgdesc="LitecoinHD is a peer-to-peer network based digital currency - Qt"
	depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq)

	install -Dm755 ltchd-v$pkgver/bin/ltchd-qt $pkgdir/usr/bin/ltchd-qt
	install -Dm644 ltchd-v$pkgver/share/man/man1/ltchd-qt.1 $pkgdir/usr/share/man/man1/ltchd-qt.1

	install -Dm755 lhd-qt.sh $pkgdir/usr/local/bin/lhd-qt
	install -Dm644 litecoinhd128.png $pkgdir/usr/share/pixmaps/ltchd128.png
	install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/ltchd-qt.desktop
	install -Dm644 COPYING $pkgdir/usr/share/licenses/ltchd/COPYING

	mkdir -p $pkgdir/usr/lib/ltchd
	cp -r ltchd-v$pkgver/lib/* $pkgdir/usr/lib/ltchd
}
