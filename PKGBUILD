# Maintainer: George Hu <integral@archlinux.org>

pkgname=zimage-ncnn-vulkan-git
_pkgname=${pkgname%-git}
pkgver=r18.86968b1
pkgrel=1
pkgdesc="ncnn implementation of Z-Image image generater"
url="https://github.com/nihui/zimage-ncnn-vulkan"
license=('Apache-2.0')
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'ncnn' 'libjpeg-turbo' 'zlib' 'libpng' 'libwebp')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cmake -S "${_pkgname}/src" \
		-B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=None \
		-D USE_SYSTEM_NCNN=ON \
		-D USE_SYSTEM_JPEG=ON \
		-D USE_SYSTEM_ZLIB=ON \
		-D USE_SYSTEM_PNG=ON \
		-D USE_SYSTEM_WEBP=ON

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
