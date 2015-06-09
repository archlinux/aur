# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-openssh-askpass
pkgname=$_pkgname-git
pkgver=0.9.0
pkgrel=1
pkgdesc="LXQt openssh password prompt"
arch=("i686" "x86_64")
url="http://lxqt.org"
license=("GPL2")
depends=("liblxqt-git")
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
