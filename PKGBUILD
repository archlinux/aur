# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkdeclarative-git
_pkgname=dtkdeclarative
pkgver=5.6.22.r9.gb5ce5a5
pkgrel=1
pkgdesc='DTK declarative modules'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkdeclarative"
license=('LGPL3')
depends=('dtkgui' 'qt5-declarative' 'qt5-quickcontrols2' 'dtkcore')
makedepends=('git' 'qt5-tools' 'cmake' 'ninja' 'gtest' 'gmock' 'doxygen' 'dtkcommon')
conflicts=("$_pkgname")
provides=("$_pkgname")
groups=('deepin-git')
source=("$_pkgname::git+https://github.com/linuxdeepin/dtkdeclarative.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	cmake -B build -GNinja \
		-DMKSPECS_INSTALL_DIR=lib/qt/mkspecs/modules/ -DBUILD_DOCS=ON \
		-DBUILD_EXAMPLES=OFF \
		-DQCH_INSTALL_DESTINATION=share/doc/qt \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$srcdir/$_pkgname"/build
	DESTDIR="$pkgdir" ninja install
}
