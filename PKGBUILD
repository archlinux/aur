# Maintainer: Stanislav N. aka pztrn <pztrn at pztrn dot name>

pkgname=kvirc-git-nokde
pkgver=5.0.0.r73.gbdeac0429
pkgrel=1
pkgdesc="Qt5 based IRC-Client, compiled without KDE support - Git Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt5-base' 'glibc' 'openssl' 'zlib' 'perl' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'qt5-webkit' 'phonon-qt5' 'enchant')
makedepends=('python2' 'gettext' 'doxygen' 'extra-cmake-modules' 'zsh' 'cmake' 'git'  'gettext')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc' 'kvirc4')
source=("$pkgname::git+https://github.com/kvirc/KVIrc.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	cd "$srcdir/$pkgname"
}

build() {
	rm -rf build
	mkdir build
	cd build
	cmake ../$pkgname \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE:STRING="Release" \
	-DWANT_AUDIOFILE:BOOL="1" \
	-DWANT_GTKSTYLE:BOOL="1" \
	-DWANT_KDE:BOOL="0"

	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir" install
}
