#!/bin/bash -e
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Fedor Piecka <teplavoda at gmail dot com>

pkgname=disig-web-signer
pkgver=2.6.1_1
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Slovak eID Web Signer by Disig"
arch=('x86_64')
license=('LicenseRef-custom')
url="https://qesportal.sk/"
source_x86_64=("https://download.disigcdn.sk/cdn/products/websigner2/disig-web-signer_${_pkgver}_amd64.deb")
sha256sums_x86_64=('9a13879952399321889c59cef13404d588cab1c154505dd6f62e3c638e493e37')
options=("!debug" "!strip")

: "${arch[@]}"
: "${license[@]}"
: "${options[@]}"
: "${pkgdesc}"
: "${pkgrel}"
: "${sha256sums_x86_64[@]}"
: "${source_x86_64[@]}"
: "${url}"

package() {
	depends=(
		glibc
		libcrypto.so
		libgcc_s.so
		libssl.so
		libstdc++.so
		libxml2.so
		qt6-base
		qt6-websockets
		sh
	)
	optdepends=(
		"gnome-shell-extension-appindicator: for system tray icon on GNOME"
	)

	: "${depends[@]}"
	: "${optdepends[@]}"
	: "${pkgdir:?}"
	: "${srcdir:?}"

	bsdtar -xf data.tar.zst -C "${pkgdir}"

	# The libraries are provided by the system.
	rm -r "${pkgdir}"/opt/disig/websigner/{bin/qt.conf,lib,plugins,share/doc/*/}

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/disig/websigner/share/doc/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
