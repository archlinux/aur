# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgbase=litecoinhd
pkgname=('litecoinhd-daemon' 'litecoinhd-cli' 'litecoinhd-qt' 'litecoinhd-tx')
pkgver=0.16.6
pkgrel=1
commit=fb64d89
arch=('x86_64')
url="https://ltchd.io"
license=('MIT')
source=("https://github.com/ltchd2019/$pkgbase/releases/download/ltchd-v$pkgver/ltchd-v$pkgver.0-$commit-x86_64-linux-gnu.tar.gz"
        "https://raw.githubusercontent.com/ltchd2019/$pkgbase/ltchd-v$pkgver/COPYING"
        "litecoinhd128.png"
        "litecoinhd-qt.desktop"
        "lhd-cli.sh"
        "lhd-qt.sh"
        "start-lhdd.sh"
        "stop-lhdd.sh")
noextract=('COPYING')
sha256sums=('c2f1a6cb8b114f2d0a6e169b52e2f2fba2c06d95ecefe776d51a60972529d205'
            'e4c2b5dd7474e599e958324fd4eb47aa67aad650e73e39e8358df2907d4af386'
            '2630ae1bfc1393f279dcbae517ff1e90e4bdc8e7fe652f7429f6231ad9af6730'
            'd990b06d30aae8c633f36fda986015921f33a9b7a326da0b471f8daa739e4fc4'
            '3bbc53f2f6764eb694827da8aede0ef8a67a14f08a83125d77a92fff5522e1ba'
            'df4d80672187123ac07497b4c95afb21c76ba5519219d0c58d45cce42206b0e2'
            '883f78ba17b283ddba0e896b6451faea84b37af89900eda426a8e55883dd2e16'
            '30f7b010b3438f83bbb16ee05d2ff848063b0b538c4c3babd0a4344e856e974f')

package_litecoinhd-qt() {
	pkgdesc="LitecoinHD is a peer-to-peer network based digital currency - Qt"
	depends=(boost-libs libevent qt5-base miniupnpc libminiupnpc.so qrencode protobuf zeromq)

	install -Dm755 ltchd-v$pkgver/bin/ltchd-qt $pkgdir/usr/bin/ltchd-qt
	install -Dm644 ltchd-v$pkgver/share/man/man1/ltchd-qt.1 $pkgdir/usr/share/man/man1/ltchd-qt.1

	install -Dm755 lhd-qt.sh $pkgdir/usr/local/bin/lhd-qt
	install -Dm644 litecoinhd128.png $pkgdir/usr/share/pixmaps/ltchd128.png
	install -Dm644 litecoinhd-qt.desktop $pkgdir/usr/share/applications/ltchd-qt.desktop
	install -Dm644 COPYING $pkgdir/usr/share/licenses/ltchd/COPYING

	mkdir -p $pkgdir/usr/lib/ltchd
	cp -r ltchd-v$pkgver/lib/* $pkgdir/usr/lib/ltchd
}

package_litecoinhd-daemon() {
	pkgdesc="LitecoinHD is a peer-to-peer network based digital currency - daemon"
	depends=(boost-libs libevent miniupnpc libminiupnpc.so zeromq)

	install -Dm755 ltchd-v$pkgver/bin/ltchdd $pkgdir/usr/bin/ltchdd
	install -Dm644 ltchd-v$pkgver/share/man/man1/ltchdd.1 $pkgdir/usr/share/man/man1/ltchdd.1

	install -Dm755 start-lhdd.sh $pkgdir/usr/local/bin/start-lhdd
	install -Dm755 stop-lhdd.sh $pkgdir/usr/local/bin/stop-lhdd
	install -Dm644 COPYING $pkgdir/usr/share/licenses/ltchd/COPYING

	mkdir -p $pkgdir/usr/lib/ltchd
	cp -r ltchd-v$pkgver/lib/* $pkgdir/usr/lib/ltchd
}

package_litecoinhd-cli() {
	pkgdesc="LitecoinHD is a peer-to-peer network based digital currency - RPC client"
	depends=(boost-libs libevent)

	install -Dm755 ltchd-v$pkgver/bin/ltchd-cli $pkgdir/usr/bin/ltchd-cli
	install -Dm644 ltchd-v$pkgver/share/man/man1/ltchd-cli.1 $pkgdir/usr/share/man/man1/ltchd-cli.1

	install -Dm755 lhd-cli.sh $pkgdir/usr/local/bin/lhd-cli
	install -Dm644 COPYING $pkgdir/usr/share/licenses/ltchd/COPYING
	mkdir -p $pkgdir/usr/lib/ltchd
	cp -r ltchd-v$pkgver/lib/* $pkgdir/usr/lib/ltchd
}

package_litecoinhd-tx() {
	pkgdesc="LitecoinHD is a peer-to-peer network based digital currency - Transaction tool"
	depends=(boost-libs openssl)

	install -Dm755 ltchd-v$pkgver/bin/ltchd-tx $pkgdir/usr/bin/ltchd-tx
	install -Dm644 ltchd-v$pkgver/share/man/man1/ltchd-tx.1 $pkgdir/usr/share/man/man1/ltchd-tx.1

	install -Dm644 COPYING $pkgdir/usr/share/licenses/ltchd/COPYING
	mkdir -p $pkgdir/usr/lib/ltchd
	cp -r ltchd-v$pkgver/lib/* $pkgdir/usr/lib/ltchd
}
