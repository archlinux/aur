# Maintainer: Tigermouthbear tigermouthbear@tigr.dev
# Contributor: x4e
pkgname="tigercapture"
pkgver="0.2"
pkgrel=0
url="https://github.com/tigermouthbear/tigercapture"
license=("GPLv3")
pkgdesc="A screen capturing and uploading util"
arch=("x86_64")
depends=("libcurl-compat" "qt5-base")
makedepends=("make" "cmake" "git")
source=("git://github.com/tigermouthbear/tigercapture.git")
sha1sums=("SKIP")

prepare() {
    cd $srcdir/$pkgname-$pkgver
    git checkout tags/v$pkgver
    git submodule update --init
}

build() {
	cd $srcdir/$pkgname-$pkgver
	mkdir build
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
	cd $srcdir/$pkgname-$pkgver/build
	make DESTDIR="$pkgdir" install
}
