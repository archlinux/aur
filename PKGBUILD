# Maintainer: Okxa <dev at okxa dot fi>
pkgname=qddcswitch
pkgver=1.1.0.2
pkgrel=2
pkgdesc="A Simple Qt frontend for switching display inputs with ddcutil."
arch=('x86_64')
url="https://codeberg.org/Okxa/qddcswitch"
license=('GPL3')
depends=('qt5-base' 'ddcutil')
makedepends=('qt5-tools')
source=("https://codeberg.org/Okxa/qddcswitch/archive/$pkgname-$pkgver.tar.gz")

build() {
	cd "$pkgname"
	rm -rf build
	mkdir build
	cd build
	qmake 'DEFINES+="APP_DATA_FOLDER=\"\\\"/usr/share\\\"\""' ../qddcswitch.pro
	make
}

package() {
	cd "$pkgname/build"
	install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
	
	install -Dm644 ../res/qddcswitch-icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
	install -Dm644 ../res/qddcswitch-icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "../packaging/$pkgname.desktop"
	# install translations (.qm)
	install -dm755 bin/locale "$pkgdir/usr/share/$pkgname/locale"
	install -Dm644 bin/locale/* "$pkgdir/usr/share/$pkgname/locale/"
}
md5sums=('a97671dd47e3ed05c1ce27b019c1660d')
