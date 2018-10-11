# Maintainer: Michael Breedlove <me@michaelbreedlove.net>
pkgname=goestools-git
pkgver=r334.bdb9673
pkgrel=1
pkgdesc="Tools to work with signals and files from GOES satellites"
arch=('x86_64')
url="https://github.com/pietern/goestools"
license=('BSD')
makedepends=(
'cmake'
'git'
'opencv'
'zlib'
)
depends=(
'airspy'
'opencv'
'rtl-sdr'
)
provides=('goestools-git')
conflicts=('goestools-git')
source=("git+${url}.git")
sha1sums=("SKIP")

pkgver() {
	cd ${pkgname%-git}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${pkgname%-git}
	git submodule update --init
}

build() {
	cd ${pkgname%-git}
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
