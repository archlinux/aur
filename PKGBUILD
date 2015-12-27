# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname="mesa-demos"
pkgname="glxgears"
pkgver=8.3.0
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="GLX version of the gears GL demo. Standalone binary from the mesa-demos project."
url="http://www.mesa3d.org/"
license=("MIT")
depends=("libgl")
makedepends=("glew")
conflicts=("$_pkgname")
source=("ftp://ftp.freedesktop.org/pub/mesa/demos/$pkgver/$_pkgname-$pkgver.tar.bz2")
sha256sums=("c173154bbd0d5fb53d732471984def42fb1b14ac85fcb834138fb9518b3e0bef")


build() {
	mkdir -p build
	cd build
	"$srcdir/$_pkgname-$pkgver/configure" --prefix=/usr
	make -C src/xdemos bin_PROGRAMS="$pkgname"
}

package() {
	cd build
	make DESTDIR="$pkgdir" -C src/xdemos bin_PROGRAMS="$pkgname" install
}
