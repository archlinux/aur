	# Maintainer: Keegan Boldt <keeganboldt@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=ktools
pkgname=$_pkgname-git
pkgver=r224.3933241
pkgrel=1
epoch=1
pkgdesc="Tools for modding of the game Don't Starve, by Klei Entertainment"
arch=("i686" "x86_64")
url="https://github.com/dstmodders/ktools.git"
license=("GPL-2.0-or-later")
depends=("imagemagick")
makedepends=("git" "cmake" "pugixml" "boost" "tclap")
optdepends=("libzip: for zip support")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/dstmodders/ktools.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -Ei '/add_subdirectory\(lib\)/d' $srcdir/$_pkgname/CMakeLists.txt
}

build() {
	cmake -S $srcdir/$_pkgname -B $srcdir/build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	make -C $srcdir/build
}

package() {
	make -C $srcdir/build DESTDIR="$pkgdir" install
}
