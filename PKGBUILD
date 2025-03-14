# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledOpen"

pkgname=untitled-open
pkgver=2.6.0.2
pkgrel=1
pkgdesc="Cross-platform C/C++ library for opening links and file pickers natively"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "dbus" "xdg-desktop-portal")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make" "pkgconf" "dbus" "xdg-desktop-portal")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a51b77d921f9f7a338d64bfdf873173b59fa861c65c78f06e242a456d2d82f38')

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
