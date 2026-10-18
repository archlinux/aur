# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20260922204113
_buildid_i686=20260922203127
_buildid_aarch64=20260922192904
_buildid_loongarch64=20260922203827
_date=2026.09.22
pkgver=52.9.${_date}
pkgrel=1
pkgdesc="A XUL-based web-browser demonstrating the Unified XUL Platform (UXP)."
url="https://www.basilisk-browser.org"
arch=('x86_64' 'aarch64' 'i686' 'loongarch64')
license=('MPL-2.0')
depends=('gtk3' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
options=('!strip')
source=('basilisk.desktop')
source_x86_64=(https://dl.basilisk-browser.org/basilisk-${_buildid_x86_64}.linux-x86_64-gtk3.tar.xz)
source_aarch64=(https://dl.basilisk-browser.org/basilisk-${_buildid_aarch64}.linux-aarch64-gtk3.tar.xz)
source_i686=(https://dl.basilisk-browser.org/basilisk-${_buildid_i686}.linux-i686-gtk3.tar.xz)
source_loongarch64=(https://dl.basilisk-browser.org/basilisk-${_buildid_loongarch64}.linux-i686-gtk3.tar.xz)

sha256sums=('c4223e966bc404467fece4a524cc2db3e99c12455087da2ade9a47b8d99d3a45')
sha256sums_x86_64=('386d4bba91ad8d24877d2f55d502b0c5f96d8f64b980ca987bac3ef14e95c2fe')
sha256sums_aarch64=('91e347cef4bda9c5d4010e8bfc50aa9e7b0a768c67cbdc4dec2474de11edd86f')
sha256sums_i686=('16f6f9ee723720a43664af627088454e68a534772f60822523442d8a4bcb51ee')
sha256sums_loongarch64=('e38a82bb746301e90fcb62a518cbd716ce9643086b40f3a23cff2894fe210822')
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
