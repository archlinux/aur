# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: DeedleFake <deedlefake at users dot noreply dot github dot com>
pkgname=coinomi-desktop
pkgver=1.1.1
pkgrel=1
pkgdesc="Coinomi desktop wallet. Securely store, manage and exchange Bitcoin, Ethereum, and more than 500 other blockchain assets."
arch=(x86_64)
url="https://coinomi.com"
license=('unknown')
depends=(java-runtime libxss)
source=("https://binaries.coinomi.com/desktop/coinomi-wallet-$pkgver-linux64.tar.gz"
	"coinomi.png")
sha256sums=('fbc3d42a1be2608748cc11acf8dff5da1ed9d7f61762b57729cbee9ae2e9f833'
            '8b390909072edf85b195dbb73b5cceb52ae9f19093cce5ae313827590ae9d576')

build() {
	chmod a+x "Coinomi/Coinomi"
	sed -i 's/^Icon=.*$/Icon=coinomi/g' "Coinomi/coinomi-wallet.desktop"
}

package() {
	mkdir -p "$pkgdir/opt"
	cp -r "$srcdir/Coinomi" "$pkgdir/opt/Coinomi/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/opt/Coinomi/Coinomi" "$pkgdir/usr/bin/Coinomi"
	install -Dm644 "Coinomi/coinomi-wallet.desktop" "${pkgdir}/usr/share/applications/coinomi-wallet.desktop"
	install -Dm644 "coinomi.png" "$pkgdir/usr/share/pixmaps/coinomi.png"
}
