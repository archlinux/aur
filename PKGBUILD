# Contributor: Dmitry Pritykin maisvendoo@gmail.com

pkgname=qslave
pkgver=1.0.2
pkgrel=1
pkgdecs="Modbus RTU network emulator for PC"
arch=('x86_64')
url="https://github.com/masivendoo/qslave.git"
license=('GPL')
depends=('qt5-base')
makedepends=('git' 'gendesk')

source=("git+https://github.com/maisvendoo/qslave.git")

sha256sums=('SKIP')

build() {
	
	cd $srcdir
	mkdir build
	cd build
	qmake ../$pkgname
	make
}

prepare() {

	
	gendesk -n --pkgname=$pkgname --pkgdesc=$pkgname
}

package() {
	
	cd $srcdir/$pkgname
	install -Dm644 LICENSE $pkgdir/usr/share/license/$pkgname/LICENSE
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $pkgname-gui/resources/img/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 cfg/example/example.net $pkgdir/etc/qslave/example/example.net
	install -Dm644 cfg/example/traffic-light.xml $pkgdir/etc/qslave/example/traffic-light.xml
	
	cd ../bin
	install -Dm755 $pkgname-gui $pkgdir/usr/bin/$pkgname 
}

