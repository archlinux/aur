# Maintainer: Yen Chi Hsuan <yan12125 at gmail>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-notificationd
pkgname=$_pkgname-git
pkgver=0.11.1.19.g84cfff0
pkgrel=1
pkgdesc="LXQt notification daemon and library."
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("LGPL2.1")
depends=("qt5-base" "liblxqt-git" "kwindowsystem")
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname" "notification-daemon")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/$_pkgname.git")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
