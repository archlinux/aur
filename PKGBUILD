# Maintainer: Jenrikku (JkKU)

pkgname=opencollada-blender-git
pkgver=r1733.4526eb8a
pkgrel=2
pkgdesc="A fork of OpenCollada to use with Blender"
arch=('x86_64')
url="https://github.com/aras-p/OpenCOLLADA"
license=('GPL')
depends=('libxml2')
provides=('opencollada')
conflicts=('opencollada')
makedepends=('git' 'cmake')
source=("git+https://github.com/aras-p/OpenCOLLADA.git")
sha256sums=('SKIP')

pkgver() {
	cd OpenCOLLADA
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd OpenCOLLADA

	[[ -d build ]] && rm -r build
	mkdir build && cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_SHARED=ON \
		-DUSE_STATIC=OFF \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5

	make
}

package() {
	cd OpenCOLLADA/build
	make DESTDIR="$pkgdir" install
}
