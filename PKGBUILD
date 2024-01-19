# Maintainer: Donald Carr<sirspudd@gmail.com>
# Upstream URL: https://wiki.qt.io/Qt_Build_Suite
#
# For improvements/fixes to this package, please send a pull request:
# http://code.qt.io/cgit/qt-labs/qbs.git/

_pkgname=qbs
pkgname=${_pkgname}-git
pkgver=v2.2.1.r36.ge769597e5
pkgrel=1
pkgdesc='Qt Build Suite: Build tool that helps simplify the build process for developing projects across multiple platforms.'
arch=('x86_64' 'i686')
url='https://wiki.qt.io/Qt_Build_Suite'
license=('LGPL')
provides=('qbs')
conflicts=('qbs')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-5compat')
makedepends=('gcc' 'git')
source=("git+https://github.com/qbs/qbs.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	mkdir -p build
	cmake -DCMAKE_INSTALL_PREFIX=/usr . -B build
	cmake --build build
}

package() {
	cd $_pkgname
	DESTDIR=${pkgdir} cmake --install build
}
