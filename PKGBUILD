# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

pkgname=gabutdm
pkgver=2.7.0
pkgrel=1
pkgdesc="Download manager with support for http, https, ftp, torrents and magnets."
arch=('x86_64')
url="https://github.com/gabutakut/gabutdm"
license=('LGPL-2.1-only')
makedepends=('meson' 'vala')
depends=('curl' 'json-glib' 'libadwaita' 'libcanberra' 'libgee' 'libsoup3' 'qrencode')
optdepends=('aria2: Bittorrent and magnets support.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gabutakut/gabutdm/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('e4b249be7d263533e5339e759eb57a80')

prepare() {
   cd "${pkgname}-${pkgver}/src"
   # Fix typo "Secconds"
   sed -i 's|Secconds|Seconds|' Preferences.vala

   # Fix typo "Running on background"
   sed -i 's|Running on background|Running in background|' Preferences.vala

   # Fix typo "in Byte"
   sed -i 's|in Byte|in Bytes|' Preferences.vala

   # Fix typo "Option"
   sed -i 's|view_mode.append_text (_("Option"));|view_mode.append_text (_("Options"));|' Preferences.vala

   # Fix typo "Shorcuts"
   sed -i 's|Shorcuts|Shortcuts|' Preferences.vala

   # Fix typo "Active Download"
   sed -i 's|Active Download|Active Downloads|' Preferences.vala

   # Fix typo "Connection"
   sed -i 's|"Connection:"|"Connections:"|' Preferences.vala

   # Fix typo "Bittorent"
   sed -i 's|Bittorent|BitTorrent|' Preferences.vala

   # Fix typo "Default"
   sed -i 's|Default|Defaults|' Preferences.vala
}

build() {
   cd "${pkgname}-${pkgver}"
   meson --prefix=/usr build
   ninja -C build
}

package() {
   cd "${pkgname}-${pkgver}"
   DESTDIR="${pkgdir}" ninja -C build install
   cd "${pkgdir}/usr/bin/"
   ln -s com.github.gabutakut.gabutdm gabutdm
}
