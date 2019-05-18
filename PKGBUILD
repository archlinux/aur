#! /bin/bash
#  (GPL3+) Alberto Salvia Novella (es20490446e.wordpress.com)

Publisher="tarassh"
pkgname="fairy-wallet"
pkgver=0.10.0
pkgrel=2
pkgdesc="Manages EOS tokens stored in a Ledger Nano S hardware wallet"
arch=("x86_64")
url="https://github.com/${Publisher}/${pkgname}"
license=("MIT")
depends=("ledger-udev")
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=("SKIP")


package () {
	tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
	install --directory "${pkgdir}/usr/bin"
	ln --symbolic "/opt/FairyWallet/fairy-wallet" "${pkgdir}/usr/bin/fairy-wallet"
}


pkgver () {
	Url="https://api.github.com/repos/${Publisher}/${pkgname}/releases/latest"
	curl --silent "${Url}" | grep "tag_name" | sed -E 's/.*"([^"]+)".*/\1/' | cut --characters="2-"
}
