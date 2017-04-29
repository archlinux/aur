# Maintainer: Johannes Sauer <sauer@ient.rwth-aachen.de>
pkgname=yuview-git 
_actualPkgname=YUView
pkgver=r1122.45015e9
pkgrel=1
pkgdesc="The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset"
arch=('x86_64')
url="https://github.com/IENT/YUView"
license=('GPL')
depends=('qt5-base' 'desktop-file-utils')
makedepends=('git') 
provides=("$_actualPkgname")
conflicts=("$_actualPkgname" libde265)
source=('git://github.com/IENT/YUView.git')
noextract=()
md5sums=('SKIP')
install="$_actualPkgname.install"

pkgver() {
	cd "$srcdir/$_actualPkgname"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_actualPkgname"
	qmake
	make
}

check() {
	cd "$srcdir/$_actualPkgname"
	make -k check
}

package() {
	cd "$srcdir/$_actualPkgname"

	#installin the binary
	make INSTALL_ROOT="$pkgdir" install

	#copying the libde265 library
	mkdir -p "$pkgdir/usr/lib/"
	cp -d "$srcdir/$_actualPkgname/libde265/libde265-internals.so"  "$pkgdir/usr/lib/"

}