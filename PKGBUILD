# Maintainer: skuroedov <skuroedov@email.cz>
# Maintainer: gardar <aur@gardar.net>

pkgname=arduino-pro-ide
pkgver=0.0.3
pkgrel=1
pkgdesc="The Arduino Pro IDE bring features that address the needs of advanced users whilst retaining continuity with the simple "classic" Arduino IDE."
arch=('x86_64')
depends=('libxss' 'gtk3' 'nodejs-lts-dubnium' 'nss' 'libxkbfile' 'python')
makedepends=('gendesk' 'ruby-ronn' 'git')
optdepends=('arduino-cli')
url="https://github.com/arduino/$pkgname"
license=('EPLv2')
install="$pkgname.install"
source=("$pkgname-$pkgver-alpha.preview-linux64.tar.xz"::"https://downloads.arduino.cc/$pkgname/$pkgname-$pkgver-alpha.preview-linux64.tar.xz" "git+git://github.com/arduino/$pkgname.git")
sha256sums=('4207a7c7dda8875685cda56191ab7e053ccb051dae4c5b40319a9bc704a747f8' 'SKIP')

prepare() {
	gendesk -f --pkgname "$pkgname" --name "Arduino Pro IDE" --pkgdesc "$pkgdesc"
	ronn -r --manual=$pkgname "$pkgname/README.md"
}

package() {
	install -dm755 "$pkgdir/opt/"
	chmod -R 755 "Arduino Pro IDE-v$pkgver-linux"
	cp -r "Arduino Pro IDE-v$pkgver-linux" "$pkgdir/opt/$pkgname"
	install -dm755 "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm 644 "$pkgname/README" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

}
