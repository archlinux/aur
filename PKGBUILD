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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tigermouthbear/tigercapture/archive/v${pkgver}.tar.gz")
sha1sums=("ba4410aa47d244c16207ed0c543d3ee0b737b0bc")

prepare() {
    cd $srcdir/$pkgname-$pkgver
    git submodule init
    git submodule update
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
