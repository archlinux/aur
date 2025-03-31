# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledI18N"

pkgname=untitled-i18n
pkgver=1.5.0.2
pkgrel=1
pkgdesc="Next generation C/C++ internationalisation library"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "yaml-cpp")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make" "yaml-cpp" "pkgconf")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1ed2188ddc28001054799e80992dd063c23a808c0efb09a45f8c8249f6ba1c45')

build() {
	cd $srcdir/$pkgname-$pkgver/ || exit
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
