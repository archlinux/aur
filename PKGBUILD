# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledDBusUtils"

pkgname=untitled-dbus-utils
pkgver=1.4.0.1
pkgrel=1
pkgdesc="C++ utilities for dealing with the low level DBus C API"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "dbus")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make" "dbus" "pkgconf")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('94bd9c7587cb92049beba8ee4d06daf9d2187b10ed4de15cfde3ce1cd0520840')

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
