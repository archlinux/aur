# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20250220145130
_buildid_i686=20250220145209
_buildid_aarch64=20250220145812
_date=2025.02.22
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
sha256sums_x86_64=('3c68e10aa640bf75c9f1a5bb66b42ed1d99255ac7f9cf016e15e6ff46d26cb3c')
sha256sums_aarch64=('4a6ab5d63e9d6f9cafe38cf710c6937494ff959c442e542fb48e860e61d99276')
sha256sums_i686=('e525fa92e33636013bd7ae16c79c0db91f3a53ff862ae85cb7222bd906634f5c')
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
