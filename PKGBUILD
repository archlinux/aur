# Maintainer: Tigermouthbear tigermouthbear@tigr.dev
pkgname="flappytiger"
pkgver="0.1"
pkgrel=0
url="https://github.com/tigermouthbear/flappytiger"
license=("MIT")
pkgdesc="An opensource flappybird clone written in C++ using GLFW"
arch=("x86_64")
makedepends=("make" "cmake" "git")
source=("git://github.com/tigermouthbear/flappytiger.git")
sha1sums=("SKIP")

prepare() {
    cd $srcdir/$pkgname
    git checkout tags/v$pkgver
    git submodule update --init --recursive
}

build() {
	cd $srcdir/$pkgname
	mkdir build
	cd build
	cmake \
            -DCMAKE_INSTALL_PREFIX="/usr" \
            -DINSTALL_APP=ON \
            ..
	make
}

package() {
	cd $srcdir/$pkgname/build
	make DESTDIR="$pkgdir" install
}
