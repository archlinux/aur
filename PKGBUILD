# Maintainer: Tigermouthbear tigermouthbear@tigr.dev
# Contributor: x4e
pkgname="tigercapture"
pkgver="0.3"
pkgrel=3
url="https://github.com/tigermouthbear/tigercapture"
license=("GPLv3")
pkgdesc="A screen capturing and uploading util"
arch=("x86_64")
depends=("qt5-base")
makedepends=("make" "cmake" "git")
source=("git://github.com/tigermouthbear/tigercapture.git")
sha1sums=("SKIP")

prepare() {
    cd $srcdir/$pkgname
    git checkout tags/v$pkgver
    git submodule update --init
}

build() {
	cd $srcdir/$pkgname
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr" -Wno-dev ..
	make
}

package() {
	cd $srcdir/$pkgname/build
	make DESTDIR="$pkgdir" install
}
