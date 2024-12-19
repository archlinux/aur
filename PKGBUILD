# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledCLIParser"

pkgname=untitled-cli-parser
pkgver=5.0.0.0
pkgrel=1
pkgdesc="C and C++ parser for CLI arguments"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('31b7111560ac8510030747b68456e76f799a0b7532667978dead41191e54951a')

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
