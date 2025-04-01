# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledOpen"

pkgname=untitled-open
pkgver=2.6.1.0
pkgrel=1
pkgdesc="Cross-platform C/C++ library for opening links and file pickers natively"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf" "dbus" "xdg-desktop-portal")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make" "pkgconf" "dbus" "xdg-desktop-portal")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('0acb6e51ef3202ecf30c1a636d449a99bb3bcfdc5e9ee7a90871c60ebe59948b')

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
