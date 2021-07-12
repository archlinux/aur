# Maintainer: Rubi Wilkins <epicalert@protonmail.com>
pkgname=facecam2d
pkgver=0.2.1
pkgrel=2
pkgdesc="2D avatar facecam software"
arch=('any')
license=('GPL3')
depends=(libzip fmt libwebp opencv glew freeglut wxgtk3 libglvnd)
makedepends=(base-devel cmake glm)
source=("https://epicalert.xyz/software/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=(4a24c0f99246c68bf9950eadcbcd99f53977c6b2e87d5b9ebe98184ec8989e29)

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
