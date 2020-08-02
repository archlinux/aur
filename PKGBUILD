# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=antimicrox-git
pkgver=3.0.r61.gffa39301
pkgrel=1
pkgdesc='Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad. Antimicro fork'
url='https://github.com/juliagoda/antimicroX'
arch=('x86_64')
license=('GPL3')
depends=('libxtst' 'hicolor-icon-theme' 'sdl2' 'qt5-x11extras')
makedepends=('git' 'cmake' 'qt5-tools' 'itstool' 'extra-cmake-modules')
conflicts=('antimicrox')
provides=('antimicrox')
source=('git://github.com/juliagoda/antimicroX#branch=master')
md5sums=('SKIP')

pkgver() {
	cd antimicroX
	# git describe
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	# other
	#_ver="$(cat CMakeLists.txt | grep -m3 -e _MAJOR_VERSION -e _MINOR_VERSION -e _PATCH_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
	# echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
        cmake -B build -S antimicroX \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DWITH_X11=ON \
              -DWITH_XTEST=ON \
              -DWITH_UINPUT=OFF \
              -DAPPDATA=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
