# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledCLIParser"

pkgname=untitled-cli-parser
pkgver=6.1.0.0
pkgrel=1
pkgdesc="C and C++ parser for CLI arguments"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a79e7cd8feef74857bb3eed21dcaf978d3e9a117a4d059b36c32135513d38bf5')

build() {
	cd $srcdir/$pkgname-$pkgver || exit
	sed -i "s/lib64/lib/g" CMakeLists.txt
	mkdir build || exit
	cd build || exit
	cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE -DUIMGUI_INSTALL=ON -DCMAKE_INSTALL_PREFIX="/usr/" || exit
	make || exit	
}

package() {
	cd $srcdir/$pkgname-$pkgver/build || exit
	cmake --install . --prefix="${pkgdir}/usr/" || exit
}
