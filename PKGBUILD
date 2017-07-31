# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-runner
pkgname=$_pkgname-git
pkgver=0.11.1.24.g1e40e33
pkgrel=1
pkgdesc="The LXQt application launcher"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("kwindowsystem" "lxqt-globalkeys-git" "menu-cache" "muparser")
makedepends=("git" "cmake" "qt5-tools")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxde/$_pkgname.git")
sha256sums=("SKIP")


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
