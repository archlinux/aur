pkgname=openspace-git
pkgver=v0.18.0.1198.g797a6fe208 
pkgrel=1
pkgdesc="OpenSpace is an open source, non-commercial, and freely available interactive data visualization software designed to visualize the entire known universe and portray our ongoing efforts to investigate the cosmos"
arch=('x86_64')
url="https://github.com/OpenSpace/OpenSpace"
license=('MIT')
makedepends=('glm' 'websocketpp' 'gdal' 'mpv')
depends=()
source=("git+https://github.com/OpenSpace/OpenSpace.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/OpenSpace"
	git describe --always | sed 's/-/./g' | sed 's/\///g' | sed 's/releases//g'
}

build() {
	cd "${srcdir}/OpenSpace"
	git submodule update --init --recursive
	rm -rf build
	mkdir -p build
	cd build
	find . -iname "libvulkan.so.1" -type f -exec rm {} \;
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/OpenSpace"
}
