# Maintainer: Cybafunk Monkey <cybafunk-monkey@posteo.eu>

_pkgname=Sparrow
pkgname=sparrow-wallet
pkgver=1.8.2
pkgrel=1
pkgdesc="Bitcoin wallet with pro functionalities like single- and multisig, Transaction Editor, built-in Tor, connection to private Electrum and much more. Different Hardware Wallets like Trezor and BitBox supported."
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache')
depends=('hicolor-icon-theme' 'alsa-lib' 'libxtst' 'libxrender' 'java-runtime' 'freetype2' 'libxcrypt-compat')
makedepends=('p7zip' 'gendesk')
validpgpkeys=('D4D0D3202FC06849A257B38DE94618334C674B40')
source=("https://github.com/sparrowwallet/sparrow/releases/download/$pkgver/sparrow-$pkgver-$CARCH.tar.gz")
sha256sums=('ffb7f86e978ab312dcc169d7c70b33048256dcf3280aecb1cb9392124eac31b9')

prepare() {
	# Comment
	gendesk --pkgname "${_pkgname}" --pkgdesc "$pkgdesc" --name=$_pkgname --exec="/usr/bin/"${_pkgname} -n --categories="Utility;Finance;"
}

package() {

	install -dm755 "${pkgdir}"/opt/${pkgname}/lib/
	install -dm755 "${pkgdir}"/usr/bin/
	
	cp -a "${srcdir}"/${_pkgname}/bin			"${pkgdir}"/opt/${pkgname}/
	cp -a "${srcdir}"/${_pkgname}/lib/app 		"${pkgdir}"/opt/${pkgname}/lib/
	cp -a "${srcdir}"/${_pkgname}/lib/runtime 	"${pkgdir}"/opt/${pkgname}/lib/
	cp -a "${srcdir}"/${_pkgname}/lib/*.so 		"${pkgdir}"/opt/${pkgname}/lib/
	
	install -Dm644 	"${srcdir}"/${_pkgname}/lib/${_pkgname}.png -t 	"${pkgdir}"/usr/share/icons/hicolor/256x256/apps/
    install -Dm644 	"${srcdir}"/${_pkgname}.desktop 				"${pkgdir}"/usr/share/applications/${_pkgname,,}-wallet.desktop
    ln -s 			"/opt/$pkgname/bin/${_pkgname}" 				"${pkgdir}"/usr/bin/
}