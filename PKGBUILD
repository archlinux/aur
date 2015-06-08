# Maintainer: Eric Pfeiffer <computerfreak@computerfr33k.com>
pkgname=paycoin-qt-bin
pkgver=0.2.0.0
pkgrel=4
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

package() {
	if [ "$CARCH" = "x86_64" ]; then
		_source_arch="64"
	else
		_source_arch="32"
	fi

	install -d "$pkgdir"/opt/Paycoin
	
	mv "$srcdir"/"$_source_arch"/paycoin-qt "$pkgdir"/opt/Paycoin/paycoin-qt
	mv "$srcdir"/"$_source_arch"/paycoind "$pkgdir"/opt/Paycoin/paycoind

	chmod 755 "$pkgdir"/opt/Paycoin/paycoin-qt
	chmod 755 "$pkgdir"/opt/Paycoin/paycoind

	install -d "$pkgdir"/usr/bin
	ln -s /opt/Paycoin/paycoin-qt "$pkgdir"/usr/bin/paycoin-qt
	ln -s /opt/Paycoin/paycoind "$pkgdir"/usr/bin/paycoind

	install -d "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir"/paycoin-wallet.desktop "$pkgdir"/usr/share/applications/paycoin-wallet.desktop
}

sha256sums=('93a4e54398aa716eb3fbc60710e81826850df1ce20aed138564ad944ad10b53e')
sha256sums_i386=('2dc72f684f3fc2eb203351c5429a4962b2063c33442d0dbeae33a410c390045a')
sha256sums_x86_64=('ea486b7e012b97ecbc89bbca4f526e3454e5936056f351227045f7f6138e230c')
