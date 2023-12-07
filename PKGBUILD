# Maintainer: tippfehlr <tippfehlr at gmail dot com>
_pkgname=inav-blackbox-explorer
pkgname=inav-blackbox-explorer-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="Interactive log viewer for flight logs recorded with blackbox"
arch=('x86_64')
url="https://github.com/iNavFlight/blackbox-log-viewer"
license=('GPL3')
provides=('inav-blackbox-explorer')
conflicts=('inav-blackbox-explorer')
source=("https://github.com/iNavFlight/blackbox-log-viewer/releases/download/$pkgver/INAV-BlackboxExplorer_linux64_$pkgver.tar.gz"
				"inav-blackbox-explorer.diff")
sha256sums=("1b5d1dc9e9d26ac869f5c78433d164e94a508b22dd865071e67cdc9f4d1dcd8d"
						"SKIP")

prepare() {
	patch "$srcdir/INAV Blackbox Explorer/inav-blackbox-explorer.desktop" < $srcdir/inav-blackbox-explorer.diff
}

package() {
	mkdir -p "$pkgdir/opt/inav"
	mkdir -p "$pkgdir/usr/bin"

	cp -dpr --no-preserve=ownership "$srcdir/INAV Blackbox Explorer/" "$pkgdir/opt/inav/inav-blackbox-explorer"
	chmod +x "$pkgdir/opt/inav/inav-blackbox-explorer/inav-blackbox-explorer"
	chmod +x "$pkgdir/opt/inav/inav-blackbox-explorer/chrome_crashpad_handler"

	install -Dm644 "$srcdir/INAV Blackbox Explorer/inav-blackbox-explorer.desktop" "$pkgdir/usr/share/applications/inav-blackbox-explorer.desktop"

	install -d "$pkgdir/usr/bin/"
	ln -s "/opt/inav/inav-blackbox-explorer/inav-blackbox-explorer" "$pkgdir/usr/bin/inav-blackbox-explorer"
}

