# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: DeedleFake <deedlefake at users dot noreply dot github dot com>
pkgname=coinomi-desktop
pkgver=1.2.2
pkgrel=2
pkgdesc="Coinomi desktop wallet. Securely store, manage and exchange Bitcoin, Ethereum, and more than 500 other blockchain assets."
arch=(x86_64)
url="https://coinomi.com"
license=('unknown')
depends=(java-runtime libxss)
source=("coinomi-wallet-1.2.2-linux64.tar.gz::https://firebasestorage.googleapis.com/v0/b/coinomi-storage/o/coinomi-binaries%2Fdesktop%2Fcoinomi-wallet-$pkgver-linux64.tar.gz?alt=media&token=651853f6-5a9f-49af-8f69-c8340929fdbd"
	"coinomi.png")
sha256sums=('07e9687ef12c36e64ab4eca33c2acd643cba1baf04617c8cf144bfbbe3c3dd5b'
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
