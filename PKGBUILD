# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=ktools
pkgname=$_pkgname-git
pkgver=97.8f31242
pkgrel=1
pkgdesc="Tools for modding of the game Don't Starve, by Klei Entertainment"
arch=("i686" "x86_64")
url="https://github.com/nsimplex/ktools"
license=("GPL2")
depends=("imagemagick")
makedepends=("git" "cmake")
optdepends=("libzip: for zip support")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/nsimplex/ktools.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
