# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-policykit
pkgname=$_pkgname-git
pkgver=0.9.0.1.g88d9a28
pkgrel=1
pkgdesc="The LXQt policykit authentication agent"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("liblxqt-git" "polkit-qt5")
makedepends=("git" "cmake")
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
