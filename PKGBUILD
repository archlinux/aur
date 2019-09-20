# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=x16-rom
pkgver=r31
pkgrel=2
pkgdesc="ROM files for The 8-Bit Guy's Commander X16"
arch=('any')
url="http://commanderx16.com/"
license=('unknown')
groups=('commander-x16')
depends=()
makedepends=('cc65' 'pandoc')
optdepends=('x16-emulator: emulator for the ROMs')
provides=()
conflicts=()
replaces=()
options=()
install=x16-rom.install
changelog=
source=("https://github.com/commanderx16/$pkgname/archive/$pkgver.tar.gz"
	"https://raw.githubusercontent.com/commanderx16/x16-emulator/4f1c937cd296c8f5cde8e463b672696d5fbd9b8c/github-pandoc.css")
md5sums=('e45226c67087580c6dff83da0a27ca8a'
         '3accdbadaf70264c743b1f655f5dc146')

build() {
	cd "$pkgname-$pkgver"
	make
	pandoc --from gfm --to html -c ../github-pandoc.css --standalone --metadata pagetitle="X16 KERNAL/BASIC/DOS ROM" README.md --output KERNAL-BASIC.html
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 rom.bin "$pkgdir/usr/share/$pkgname/rom.bin"
	install -Dm644 rom-c64.bin "$pkgdir/usr/share/$pkgname/rom-c64.bin"
	install -Dm644 ../github-pandoc.css "$pkgdir/usr/share/doc/$pkgname/github-pandoc.css"
	install -Dm644 KERNAL-BASIC.html "$pkgdir/usr/share/doc/$pkgname/KERNAL-BASIC.html"
}
