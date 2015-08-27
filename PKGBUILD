# Maintainer: Sarwo Hadi Setyana <sh.setyana@gmail.com>

pkgname=mouseserver
pkgsrc=mouseserver-sourcecode-Linux
pkgver=1.0.1
pkgrel=3
pkgdesc="Mouse server for WiFi Mouse"
arch=('i686' 'x86_64')
url="http://wifimouse.necta.us/"
license=('GPL2')
depends=('gtk2')
makedepends=('cmake' 'unrar')
source=("http://wifimouse.necta.us/MSSourceForLinux.rar")
md5sums=('af6ad9380187fef3029cc9eb2f1881cb')
noextract=("MSSourceForLinux.rar")

prepare() {
        cd "$srcdir"
	unrar x MSSourceForLinux.rar
	mkdir "$srcdir/$pkgsrc/build"
	cd "$srcdir/$pkgsrc/build"
	sed -i 's,/usr/sbin,${CMAKE_INSTALL_PREFIX},g' ../CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgsrc/build"
	cmake ../ -DCMAKE_INSTALL_PREFIX=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgsrc/build"
	make DESTDIR="$pkgdir" install
}
