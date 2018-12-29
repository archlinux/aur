# Maintainer: Quentin Bazin <quent42340 at gmail dot com>

_pkgname=gamekit
pkgname="${_pkgname}-git"
pkgver=0.0.1
pkgrel=1
pkgdesc="Unarelith's C++ gamedev toolkit"
arch=("i686" "x86_64")
url="https://github.com/Quent42340/GameKit"
depends=("glm" "sdl2" "sdl2_image" "sdl2_ttf" "tinyxml2")
makedepends=("cmake")
provides=("gamekit")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cmake .
	cmake --build .
}

package() {
	cmake --build "${_pkgname}" --target install -- DESTDIR="${pkgdir}"
}

