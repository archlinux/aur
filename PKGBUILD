# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledExec"

pkgname=untitled-exec
pkgver=5.0.0.0
pkgrel=1
pkgdesc="C/C++ cross-platform wrapper for launching applications as separate processes"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf")
provides=("libuexec.so")
makedepends=("cmake" "make")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('7eb813dff929c32dc34e7dfe4426effe8e8ed23b684b32044e8949445ceb8ebb')

build() {
	cd $srcdir || exit
	sed -i "s/lib64/lib/g" CMakeLists.txt
	mkdir build || exit
	cd build || exit
	cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE -DUIMGUI_INSTALL=ON -DCMAKE_INSTALL_PREFIX="/usr/" || exit
	make || exit	
}

package() {
	cd $srcdir/build || exit
	cmake --install . --prefix="${pkgdir}/usr/" || exit
}
