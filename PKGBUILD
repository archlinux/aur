# Maintainer: Keegan Boldt <keeganboldt@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=ktools
pkgname=$_pkgname-git
pkgver=r224.3933241
pkgrel=1
pkgdesc="Tools for modding of the game Don't Starve, by Klei Entertainment"
arch=("i686" "x86_64")
url="https://github.com/dstmodders/ktools.git"
license=("GPL-2.0-or-later")
depends=("imagemagick")
makedepends=("git" "cmake")
optdepends=("libzip: for zip support")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/dstmodders/ktools.git")
sha256sums=("SKIP")


pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p build
	cd build
	cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
