# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname="mesa-demos"
pkgname="glxinfo"
pkgver=8.4.0
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Display info about a GLX extension and OpenGL renderer. Standalone binary from the mesa-demos project."
url="http://www.mesa3d.org/"
license=("MIT")
depends=("libgl")
makedepends=("glew")
conflicts=("$_pkgname")
source=("ftp://ftp.freedesktop.org/pub/mesa/demos/$_pkgname-$pkgver.tar.bz2")
sha256sums=("01e99c94a0184e63e796728af89bfac559795fb2a0d6f506fa900455ca5fff7d")


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
