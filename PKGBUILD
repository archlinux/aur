# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20250422154702
_buildid_i686=20250422154908
_buildid_aarch64=20250423150110
_date=2025.04.23
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
sha256sums_x86_64=('e56a947df18c9ac5c5db726d15b87d16ca4389e876c87726909e06ac4f3255e6')
sha256sums_aarch64=('abed26cbaaa6bc88ae13ce606405be91111eed19b486812f5a00469dcf2a85bc')
sha256sums_i686=('37d859134df4c1b8ae4e623a987f3be1c364fd394723c2d7c01f55079efb0778')
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
