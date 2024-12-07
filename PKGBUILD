# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledDBusUtils"

pkgname=untitled-dbus-utils
pkgver=1.2.0.0
pkgrel=1
pkgdesc="C++ utilities for dealing with the low level DBus C API"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "dbus")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make" "dbus" "pkgconf")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('16836a3c18a89289ff7724615f1e287eef4ff2d809fb8849bee65abfc55109b7')

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
