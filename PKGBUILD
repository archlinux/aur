# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_pkgname=basilisk
pkgname=${_pkgname}-bin
epoch=1
_buildid_x86_64=20260613193747
_buildid_i686=20260614135849
_buildid_aarch64=20260613182632
_buildid_loongarch64=20260613181555
_date=2026.06.12
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
sha256sums_x86_64=('adfc719e1764c933dafdacb0bb21b8ea880c1df6b97112516ff1d31cff4b2317')
sha256sums_aarch64=('398860c46f9a8e572b9c43a4a8ed42c5fff2f51f60876b4122be685a98b69f2c')
sha256sums_i686=('eb71be4b58c96cb3c9bd5f8a3eb64aee31f69ba10596169a7d55d3f8e563dda5')
sha256sums_loongarch64=('bd33733a874d84330d8baa72dae30708e7cc8e836b40ee9a1a76875becfb169f')
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
