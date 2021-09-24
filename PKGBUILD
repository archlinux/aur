# Maintainer: Rubi Wilkins <epicalert@protonmail.com>
pkgname=facecam2d
pkgver=0.3.2
pkgrel=1
pkgdesc="2D avatar facecam software"
arch=('any')
license=('GPL3')
depends=(libzip fmt libwebp opencv glew freeglut wxgtk3 libglvnd)
makedepends=(gcc make cmake glm)
source=("https://files.epicalert.xyz/software/src/$pkgname-v$pkgver.tar.gz")
sha256sums=('3d8f323d133ce74ea0d9098871d128cd90108ca1d7d5ea439d3ef1aa3f7ce5e8')

build() {
	cd $srcdir

	mkdir -p build
	cd build

	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 \
		-DwxWidgets_wxrc_EXECUTABLE=/usr/bin/wxrc \
		..
	make
}

package() {
	cd $srcdir/build

	make DESTDIR=$pkgdir install
}
