pkgname=arduino-ide
pkgver=2.0.0
pkgrel=8
_betaver=beta.8
pkgdesc="Arduino IDE 2.0"
arch=('x86_64')
options=("!strip")
depends=('libxkbfile' 'libxss' 'nss')
makedepends=('gendesk')
url="https://github.com/arduino/$pkgname"
license=('AGPL3')
install=$pkgname.install
source=(
       "https://downloads.arduino.cc/$pkgname/${pkgname}_${pkgver}-${_betaver}_Linux_64bit.zip"
       "https://www.arduino.cc/en/uploads/Trademark/ArduinoCommunityLogo.png"
)
sha256sums=(
       '0b573a1e1693a82b39293ef20a97d171b86d8bc704fcefb851b081faed2cfe51'
       'd0e1a18d4553df38ffc34c0699369500e8a8129647207c65d36e615870d7fe3c'
)

prepare() {
	gendesk -f --pkgname $pkgname --name 'Arduino IDE' --pkgdesc $pkgdesc
}

package() {
	install -dm755 "$pkgdir/opt/"
	mv "${pkgname}_${pkgver}-${_betaver}_Linux_64bit" "${pkgname}"
	chmod -R 755 "${pkgname}"
	cp -r "${pkgname}" "$pkgdir/opt/$pkgname"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "ArduinoCommunityLogo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
