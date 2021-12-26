# Contributor: FabioLolix
# Contributor: netroy

pkgname=arduino-ide-beta-bin
_pkgver=2.0.0-rc3
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Arduino prototyping platform IDE, rewrite based on the Theia IDE framework"
arch=(x86_64)
url="https://github.com/arduino/arduino-ide"
license=(AGPL3)
depends=(libxkbfile libxss nss)
makedepends=(gendesk)
provides=(arduino-ide)
conflicts=(arduino-ide)
install=arduino-ide.install
options=(!strip)
source=("https://downloads.arduino.cc/arduino-ide/arduino-ide_${_pkgver}_Linux_64bit.zip"
        "https://www.arduino.cc/en/uploads/Trademark/ArduinoCommunityLogo.png")
sha256sums=('835e69c76fb1d093f1d72f8fe2ea92c1b8cb34a37702de174f85eee4865f78a4'
            'd0e1a18d4553df38ffc34c0699369500e8a8129647207c65d36e615870d7fe3c')

prepare() {
	gendesk -f --pkgname arduino-ide --name 'Arduino IDE' --pkgdesc ${pkgdesc}
}

package() {
	install -dm755 "$pkgdir/opt/"
	mv "arduino-ide_${_pkgver}_Linux_64bit" "arduino-ide"
	chmod -R 755 "arduino-ide"
	cp -r "arduino-ide" "$pkgdir/opt/arduino-ide"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/arduino-ide/arduino-ide" "$pkgdir/usr/bin/arduino-ide"
	install -Dm644 "arduino-ide.desktop" "$pkgdir/usr/share/applications/arduino-ide.desktop"
	install -Dm644 "ArduinoCommunityLogo.png" "$pkgdir/usr/share/pixmaps/arduino-ide.png"
}
