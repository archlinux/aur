# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20250612221311
_buildid_i686=20250612221237
_buildid_aarch64=20250612222555
_date=2025.06.13
pkgver=52.9.${_date}
pkgrel=1
pkgdesc="A XUL-based web-browser demonstrating the Unified XUL Platform (UXP)."
url="https://www.basilisk-browser.org"
arch=('x86_64' 'aarch64' 'i686')
license=('GPL')
depends=('gtk2' 'gtk3' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
source=('basilisk.desktop')
source_x86_64=(https://dl.basilisk-browser.org/basilisk-${_buildid_x86_64}.linux-x86_64-gtk3.tar.xz)
source_aarch64=(https://dl.basilisk-browser.org/basilisk-${_buildid_aarch64}.linux-aarch64-gtk3.tar.xz)
source_i686=(https://dl.basilisk-browser.org/basilisk-${_buildid_i686}.linux-i686-gtk3.tar.xz)

sha256sums=('c4223e966bc404467fece4a524cc2db3e99c12455087da2ade9a47b8d99d3a45')
sha256sums_x86_64=('fa3027133bee06a2777343ac356642d9c27ad52677d928fdab25527a9623d475')
sha256sums_aarch64=('4b265525ab9adc1560dfebd6f1aa6893430e3ddb9850dd7a5493be3fe2b68a10')
sha256sums_i686=('1b22c5f758e1393f077f8f8ec8a67dc0243b5201f868f87d82c067c34f9d8727')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

package() {
	mkdir -p "$pkgdir"/opt
	cp -ar --no-preserve=ownership "$srcdir"/basilisk "$pkgdir"/opt
	mkdir -p "${pkgdir}"/usr/bin
	cat > "${pkgdir}"/usr/bin/basilisk <<- __EOF__
		#!/bin/sh
		exec /opt/basilisk/basilisk "\$@"
	__EOF__
	chmod 755 "${pkgdir}"/usr/bin/basilisk
	install -Dm644 "${srcdir}"/basilisk.desktop "${pkgdir}"/usr/share/applications/basilisk.desktop
	install -Dm644 "${srcdir}"/basilisk/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/basilisk.png
}
