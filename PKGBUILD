pkgname=dialer-phonepi
pkgver=1
pkgrel=2
pkgdesc="Dialer application and call daemon for PhonePi project"
url="https://github.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" "cmake")
depends=("qt5-base" "qt5-tools" "qt5-3d" "glib2" "dbus" "dbus-glib")
source=(git://github.com/PhonePi/phonepi.git)
sha256sums=("SKIP")

build() {
	cd "$srcdir/phonepi/src/phone/daemon"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make

	cd "$srcdir/phonepi/src/phone/qt"
	qmake
	make
}

package() {
	cd "$srcdir/phonepi/src/phone/daemon"
	make DESTDIR=$pkgdir install

	cd "$srcdir/phonepi/src/phone/qt"
	make DESTDIR=$pkgdir install
}
