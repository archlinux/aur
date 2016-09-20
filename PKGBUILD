# Maintainer: Kyle Terrien <kyleterrien at gmail dot com>
pkgname=wrpn
pkgver=6.0.8
pkgrel=2
pkgdesc="Windows Reverse Polish Notation, a software clone of the HP-16C"
arch=(any)
url="http://www.wrpn.emmet-gray.com/"
license=('Public Domain')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment')
source=("WRPN_Java-6.0.8.zip::http://www.wrpn.emmet-gray.com/Files/WRPN_Java.zip"
		"wrpn.sh"
		"wrpn.desktop")
sha256sums=('d311c52e225b53f91801a38a58ae184e70e8c6efa03c15d92854160e848fbc82'
            '0e1e5221e864d43195c692b7151cbff184e2356e3cfbe8fd3f8821071cefe4bc'
            '4b712ccb6bfb147550210bdc523a391f03f0443ffe1da00403097f279bfcb066')

build() {
	cd "WRPN/"
	ant
}

package() {
	mkdir -p "$pkgdir/usr/share/java/wrpn"
	install -m644 WRPN/dist/WRPN.jar "$pkgdir/usr/share/java/wrpn/WRPN.jar"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 wrpn.sh "$pkgdir/usr/bin/wrpn"
	mkdir -p "$pkgdir/usr/share/applications"
	install -m644 wrpn.desktop "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps"
	install -m644 "WRPN/src/com/emmetgray/wrpn/resources/WRPN_ico.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/wrpn.png"
	mkdir -p "$pkgdir/usr/share/doc/wrpn"
	install -m644 WRPN/Readme.txt "$pkgdir/usr/share/doc/wrpn/"
	install -m644 "WRPN/Release Notes.txt" "$pkgdir/usr/share/doc/wrpn/Release-Notes.txt"
}

# vi: noet ts=4 sw=4
