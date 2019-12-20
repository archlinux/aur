# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=x16-rom
pkgver=r35
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/commanderx16/$pkgname/archive/$pkgver.tar.gz"
	"https://raw.githubusercontent.com/commanderx16/x16-emulator/$pkgver/github-pandoc.css")
md5sums=('59c7d0562b9b05989897d884c11b3b9a'
         '3accdbadaf70264c743b1f655f5dc146')

build() {
	cd "$pkgname-$pkgver"
	_pkgver1=${pkgver#r}
	make PRERELEASE_VERSION=${_pkgver1%%[^0-9]*}
	pandoc --from gfm --to html -c github-pandoc.css --standalone --metadata pagetitle="X16 KERNAL/BASIC/DOS ROM" README.md --output KERNAL-BASIC.html
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 rom.bin "$pkgdir/usr/share/$pkgname/rom.bin"
	install -Dm644 ../github-pandoc.css "$pkgdir/usr/share/doc/$pkgname/github-pandoc.css"
	install -Dm644 KERNAL-BASIC.html "$pkgdir/usr/share/doc/$pkgname/KERNAL-BASIC.html"
}
