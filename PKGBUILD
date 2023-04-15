# Maintainer: Cybafunk Monkey <cybafunk-monkey@posteo.eu>

_pkgname=Sparrow
pkgname=sparrow-wallet
pkgver=1.7.6
pkgrel=1
pkgdesc="Bitcoin wallet with pro functionalities like single- and multisig, Transaction Editor, built-in Tor, connection to private Electrum and much more. Different Hardware Wallets like Trezor and BitBox supported."
arch=('x86_64')
url="https://sparrowwallet.com/"
license=('Apache')
depends=('hicolor-icon-theme' 'alsa-lib' 'libxtst' 'libxrender' 'java-runtime' 'freetype2')
makedepends=('p7zip' 'gendesk')
validpgpkeys=('D4D0D3202FC06849A257B38DE94618334C674B40')
source=("https://github.com/sparrowwallet/sparrow/releases/download/$pkgver/sparrow-$pkgver-$CARCH.tar.gz")
sha256sums=('e3a3db024145a434621b7c69a8016a6aa2b6d61159d06d91dc5ca308d2a17a06')

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