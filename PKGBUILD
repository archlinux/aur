# Maintainer: gardar <aur@gardar.net>

pkgname=arduino-pro-ide
pkgver=0.1.3
pkgrel=1
pkgdesc="The Arduino Pro IDE bring features that address the needs of advanced users whilst retaining continuity with the simple "classic" Arduino IDE."
arch=('x86_64')
depends=('libxss' 'gtk3' 'nodejs-lts-dubnium' 'nss' 'libxkbfile' 'python')
makedepends=('gendesk' 'ruby-ronn' 'git')
optdepends=('arduino-cli')
url="https://github.com/arduino/$pkgname"
license=('EPLv2')
install="$pkgname.install"
source=("https://downloads.arduino.cc/$pkgname/${pkgname}_${pkgver}_Linux_64bit.zip" "git+git://github.com/arduino/$pkgname.git")
sha256sums=('d1e887cac7c83ccc6760de137b2d614b0dfdf4117dd6ca4950510a20c8161f52' 'SKIP')

prepare() {
	gendesk -f --pkgname "$pkgname" --name "Arduino Pro IDE" --pkgdesc "$pkgdesc"
	ronn -r --manual=$pkgname "$pkgname/README.md"
	
}

package() {
	install -dm755 "$pkgdir/opt/"
	chmod -R 755 "${pkgname}_${pkgver}_Linux_64bit"
	cp -r "${pkgname}_${pkgver}_Linux_64bit" "$pkgdir/opt/$pkgname"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm 644 "$pkgname/README" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

}
