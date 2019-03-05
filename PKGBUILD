# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: DeedleFake <deedlefake at users dot noreply dot github dot com>
pkgname=coinomi-desktop
pkgver=1.0.7
pkgrel=1
pkgdesc="Coinomi desktop wallet. Securely store, manage and exchange Bitcoin, Ethereum, and more than 500 other blockchain assets."
arch=(x86_64)
url="https://coinomi.com"
license=('unknown')
depends=(java-runtime=8 java-openjfx)
source=("https://coinomistorage.blob.core.windows.net/desktop/coinomi-wallet-$pkgver-linux64.tar.gz"
	"coinomi.png")
sha256sums=('d8f53819a1a99cc36558ac2e1b7b89ccb2774c3596a7d2011b275f5f4e5e962d'
            'SKIP')

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
