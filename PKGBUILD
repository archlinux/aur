# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledOpen"

pkgname=untitled-open
pkgver=2.6.0.0
pkgrel=1
pkgdesc="Cross-platform C/C++ library for opening links and file pickers natively"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "dbus" "xdg-desktop-portal")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make" "pkgconf" "dbus" "xdg-desktop-portal")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('8d57518c5c29fa9901c831c78ee0d6a5579e76076bd2fce630de1211021b039b')

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
