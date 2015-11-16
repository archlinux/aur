# Maintainer: Eric Pfeiffer <computerfreak@computerfr33k.com>
pkgname=paycoin-qt-bin
pkgver=0.3.3.0
pkgrel=1
epoch=
pkgdesc="PayCoin is a global currency that lets you send money to anyone, anywhere, anytime. Sending and accepting money is virtually free, lightning fast and insanely easy."
arch=('i386' 'x86_64')
url="http://paycoin.com"
license=('MIT/X11')
groups=('network')
depends=('qt4')
makedepends=()
checkdepends=()
optdepends=()
provides=('paycoin-qt' 'paycoind')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('paycoin-wallet.desktop')
noextract=()
validpgpkeys=()

source_i386=("https://github.com/PaycoinFoundation/paycoin/releases/download/v${pkgver}/linux32.zip")
source_x86_64=("https://github.com/PaycoinFoundation/paycoin/releases/download/v${pkgver}/linux64.zip")

sha256sums=('711d5c86aab6e324aef38ab52dc5426b24a18b2daab63cc0bbfcb490a6216a0b')
sha256sums_i386=('315fef82b7ced7c86ea46bc0c54e3fb677e7aa7aeb14a08c46f8a8688c7d56e0')
sha256sums_x86_64=('a3bf33b4e737f10a80700439b612bf1e0aa901ae589c7b38068e08d79aadcc76')

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="64"
	else
		_source_arch="32"
	fi

	install -d "$pkgdir"/opt/Paycoin
	
	mv "$srcdir"/paycoin-qt "$pkgdir"/opt/Paycoin/paycoin-qt
	mv "$srcdir"/paycoind "$pkgdir"/opt/Paycoin/paycoind

	chmod 755 "$pkgdir"/opt/Paycoin/paycoin-qt
	chmod 755 "$pkgdir"/opt/Paycoin/paycoind

	install -d "$pkgdir"/usr/bin
	ln -s /opt/Paycoin/paycoin-qt "$pkgdir"/usr/bin/paycoin-qt
	ln -s /opt/Paycoin/paycoind "$pkgdir"/usr/bin/paycoind

	install -d "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir"/paycoin-wallet.desktop "$pkgdir"/usr/share/applications/paycoin-wallet.desktop
}
