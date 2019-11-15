#! /bin/bash

Publisher="tarassh"
pkgname="fairy-wallet"

depends=("ledger-udev")
provides=("${pkgname}")
conflicts=("${pkgname}")

pkgver=0.10.0
pkgrel=3
arch=("x86_64")

pkgdesc="Manages EOS tokens stored in a Ledger Nano S hardware wallet"
url="https://github.com/${Publisher}/${pkgname}"
license=("MIT")

Version=$(
	Url="https://api.github.com/repos/${Publisher}/${pkgname}/releases/latest"
	curl --silent "${Url}" | grep "tag_name" | sed -E 's/.*"([^"]+)".*/\1/' | cut --characters="2-")
source=("${url}/releases/download/v${Version}/${pkgname}_${Version}_amd64.deb")
sha256sums=("SKIP")


pkgver() {
	cd "${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package () {
	tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
	mkdir --parents "${pkgdir}/usr/bin"
	ln --symbolic "/opt/FairyWallet/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

