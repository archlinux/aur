# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=ardupilot-gazebo-sitl-git
pkgver=r31.9bae0ea
pkgrel=1
pkgdesc="Gazebo plugin for Ardupilot's SITL."
arch=('x86_64')
url='https://ardupilot.org/dev/docs/using-gazebo-simulator-with-sitl.html'
license=('GPLv3')
depends=('gazebo')
optdepends=('ardupilot-sitl')
makedepends=('cmake')
provides=('ardupilot-gazebo-sitl')
_pkgname=ardupilot-gazebo-stil
source=("${_pkgname}::git+https://github.com/khancyr/ardupilot_gazebo.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p ${srcdir}/${_pkgname}/build
    cd ${srcdir}/${_pkgname}/build

	cmake .. \
        -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr"

    make
}

package() {
    cd ${srcdir}/${_pkgname}/build
	make DESTDIR="$pkgdir/" install
}
