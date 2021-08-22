pkgname=arduino-ide-bin
pkgver=2.0.0
pkgrel=10
_betaver=beta.10
pkgdesc="Arduino IDE 2.0"
arch=('x86_64')
options=("!strip")
depends=('libxkbfile' 'libxss' 'nss')
makedepends=('gendesk')
provides=('arduino-ide')
conflicts=('arduino-ide')
url="https://github.com/arduino/arduino-ide"
license=('AGPL3')
install=arduino-ide.install
source=(
       "https://downloads.arduino.cc/arduino-ide/arduino-ide_${pkgver}-${_betaver}_Linux_64bit.zip"
       "https://www.arduino.cc/en/uploads/Trademark/ArduinoCommunityLogo.png"
)
sha256sums=(
       '27ca0493a88c5425ed26d20f9ada42b3ea00bd334ffd904a4844923f0c235e15'
       'd0e1a18d4553df38ffc34c0699369500e8a8129647207c65d36e615870d7fe3c'
)

prepare() {
	gendesk -f --pkgname $pkgname --name 'Arduino IDE' --pkgdesc $pkgdesc
}

package() {
	install -dm755 "$pkgdir/opt/"
	mv "arduino-ide_${pkgver}-${_betaver}_Linux_64bit" "arduino-ide"
	chmod -R 755 "arduino-ide"
	cp -r "arduino-ide" "$pkgdir/opt/arduino-ide"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/arduino-ide/arduino-ide" "$pkgdir/usr/bin/arduino-ide"
	install -Dm644 "arduino-ide.desktop" "$pkgdir/usr/share/applications/arduino-ide.desktop"
	install -Dm644 "ArduinoCommunityLogo.png" "$pkgdir/usr/share/pixmaps/arduino-ide.png"
}
