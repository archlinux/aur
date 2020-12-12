# Maintainer: Tigermouthbear tigermouthbear@tigr.dev
# Contributor: x4e
pkgname="tigercapture"
pkgver="0.1"
pkgrel=0
url="https://github.com/tigermouthbear/tigercapture"
license=("GPLv3")
pkgdesc="A screen capturing and uploading util"
arch=("x86_64")
makedepends=("make" "cmake" "git")
source=("git://github.com/tigermouthbear/tigercapture.git")
sha1sums=("SKIP")

prepare() {
	cd $srcdir/$pkgname
	git submodule init
	git submodule update
}

build() {
	echo $srcdir
	ls $srcdir
	cd $srcdir/$pkgname
	mkdir -p build
	cd build
	cmake \
            -DCMAKE_BUILD_TYPE="Release" \
            -DCMAKE_INSTALL_PREFIX="/usr" \
            -Wno-dev \
			--target all \
			-- \
            ..
	make
}

package() {
	echo $pkgdir
	cd $srcdir/$pkgname/build
	make DESTDIR="$pkgdir" install
	ls -R $pkgdir
}
