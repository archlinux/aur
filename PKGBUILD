# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledI18N"

pkgname=untitled-i18n
pkgver=1.6.0.0
pkgrel=1
pkgdesc="Next generation C/C++ internationalisation library"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make" "pkgconf")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('dbfe5869b5922f42e8f76a6d26537ef1054865d93ef02a8a54342e7c8f0e2f37')

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
