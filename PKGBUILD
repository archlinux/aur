# Maintainer: Stanislav Vasilev <contact@i-use-gentoo-btw.com>

PKG_REAL_NAME="UntitledXDGBasedir"

pkgname=untitled-xdg-basedir
pkgver=4.0.0.0
pkgrel=1
pkgdesc="C/C++ implementation of the XDG basedir specification"
url="https://github.com/MadLadSquad/${PKG_REAL_NAME}"
arch=(x86_64 aarch64)
license=('MIT')
depends=("gcc-libs" "glibc" "pkgconf")
provides=("lib${PKG_REAL_NAME}.so")
makedepends=("cmake" "make")
source=("https://github.com/MadLadSquad/${PKG_REAL_NAME}/releases/download/v${pkgver}/${pkgname}.tar.xz")
sha256sums=('dc6862e4713a2d85c30144e0b7caa2850dc1ab487691b4c9f356c35741387e28')

build() {
	cd $srcdir || exit
	sed -i "s/lib64/lib/g" CMakeLists.txt
	mkdir build || exit
	cd build || exit
	cmake .. -G"Unix Makefiles" -DNO_IGNORE_RELATIVE_DIRS=OFF -DCREATE_DIRS=OFF -DCMAKE_BUILD_TYPE=RELEASE -DUIMGUI_INSTALL=ON -DCMAKE_INSTALL_PREFIX="/usr/" || exit
	make || exit	
}

package() {
	cd $srcdir/build || exit
	cmake --install . --prefix="${pkgdir}/usr/" || exit
}
