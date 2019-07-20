# Maintainer: Utkan Güngördü <utkan@freeconsole.org>

pkgname=waifu2x-ncnn-vulkan-git
_pkgname=waifu2x-ncnn-vulkan
pkgver=20190712.r0.g0995d88
pkgrel=1
pkgdesc="High-performance neural network inference framework optimized for the mobile platform"
url="https://github.com/nihui/waifu2x-ncnn-vulkan"
license=('MIT')
depends=('ncnn-git')
makedepends=('git' 'cmake')
conflicts=('waifu2x-ncnn-vulkan')
provides=('waifu2x-ncnn-vulkan')
arch=('i686' 'x86_64')
source=("git://github.com/nihui/waifu2x-ncnn-vulkan.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/waifu2x-ncnn-vulkan"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/waifu2x-ncnn-vulkan"
	sed -ie 's/\/home\/nihui\/osd\/ncnn\/build\/install\/include/\/usr\/include\/ncnn/' CMakeLists.txt
	sed -ie 's/\/home\/nihui\/osd\/ncnn\/build\/install\/lib/\/usr\/lib/' CMakeLists.txt
}

build() {
	cd "${srcdir}/waifu2x-ncnn-vulkan"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}/usr ..
	make
}

package() {
	cd "${srcdir}/waifu2x-ncnn-vulkan"
	install -Dm755 "build/waifu2x-ncnn-vulkan" "${pkgdir}/usr/bin/waifu2x-ncnn-vulkan"
}
