# Maintainer: skuroedov <skuroedov@email.cz>
# Maintainer: gardar <aur@gardar.net>

pkgname=arduino-pro-ide-latest
pkgver=0.1.2
pkgrel=1
pkgdesc="The Arduino Pro IDE bring features that address the needs of advanced users whilst retaining continuity with the simple "classic" Arduino IDE."
arch=('x86_64')
depends=('libxss' 'gtk3' 'nodejs-lts-dubnium' 'nss' 'libxkbfile' 'python' 'arduino-cli') 
makedepends=('gendesk' 'ruby-ronn' 'git')
url="https://github.com/arduino/arduino-pro-ide"
license=('EPLv2')
install="arduino-pro-ide-latest.install"
source=("https://downloads.arduino.cc/arduino-pro-ide/arduino-pro-ide_${pkgver}_Linux_64bit.zip" "git+git://github.com/arduino/arduino-pro-ide.git")
noextract=("arduino-pro-ide_${pkgver}_Linux_64bit.zip")

# Sums
sha1sums=('0a7b12129275fc1fc50ee4380478ea451f096a0f' 'SKIP')
sha224sums=('9fd87b4c156a06040c331696d98d18f2e4af8c494a167b17798d5d1e' 'SKIP')
sha256sums=('b98a23986d788c3214647eca3bb57be09865ab15676c7b245bc41e7b9b8d8477' 'SKIP')
sha384sums=('2e8703547f8f32c67afda0f2057775ec3bd7a722c04b1589d138c5e66bdf369a9ba5cb508a6077d22072bd464782eaab' 'SKIP')
sha512sums=('32e4cedc4abb5da999df025751f016e97a3302e8cc0183f4f31f940497313e187ef3dca92608554b676f01dac27416fe5fe17f31715b0e540d038e97eed9510a' 'SKIP')
b2sums=('32e4cedc4abb5da999df025751f016e97a3302e8cc0183f4f31f940497313e187ef3dca92608554b676f01dac27416fe5fe17f31715b0e540d038e97eed9510a' 'SKIP')
prepare() {
	mkdir "Arduino Pro IDE-v$pkgver-linux"
	bsdtar xf "arduino-pro-ide_${pkgver}_Linux_64bit.zip") -C "Arduino Pro IDE-v$pkgver-linux"
	gendesk -f --pkgname "arduino-pro-ide" --name "Arduino Pro IDE" --pkgdesc "$pkgdesc"
	ronn -r --manual=arduino-pro-ide "arduino-pro-ide/README.md"
	
}

package() {
	install -dm755 "$pkgdir/opt/"
	chmod -R 755 "Arduino Pro IDE-v$pkgver-linux"
	cp -r "Arduino Pro IDE-v$pkgver-linux" "$pkgdir/opt/arduino-pro-ide"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/arduino-pro-ide/arduino-pro-ide_${pkgver}_Linux_64bit" "${pkgdir}/usr/bin/arduino-pro-ide"
	install -Dm644 "arduino-pro-ide/LICENSE.md" "$pkgdir/usr/share/licenses/arduino-pro-ide/LICENSE.md"
	install -Dm644 "arduino-pro-ide/README" "$pkgdir/usr/share/man/man1/arduino-pro-ide.1"
	install -Dm644 "arduino-pro-ide.desktop" "$pkgdir/usr/share/applications/arduino-pro-ide.desktop"
	install -Dm644 "arduino-pro-ide.png" "$pkgdir/usr/share/pixmaps/arduino-pro-ide.png"
    
}
