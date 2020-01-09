# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=antimicrox-git
pkgver=2.25.18.g5b8011d
pkgrel=1
pkgdesc='Map keyboard and mouse actions to gamepad buttons, inspired by qjoypad. Antimicro fork'
url='https://github.com/juliagoda/antimicroX'
arch=('x86_64')
license=('GPL3')
depends=('libxtst' 'qt5-base' 'sdl2')
makedepends=('git' 'cmake' 'qt5-tools' 'itstool' 'extra-cmake-modules')
source=('git://github.com/juliagoda/antimicroX#branch=master')
md5sums=('SKIP')

pkgver() {
	cd antimicroX
	# git describe
	git describe --long --tags | sed 's/-/./g'
	# other
	#_ver="$(cat CMakeLists.txt | grep -m3 -e _MAJOR_VERSION -e _MINOR_VERSION -e _PATCH_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
	# echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd antimicroX
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
              -DUSE_SDL_2=ON \
              -DWITH_XTEST=ON \
              -DWITH_UINPUT=OFF \
              -DAPPDATA=ON
	make
}

package() {
	cd antimicroX
	make DESTDIR="$pkgdir" install
}
