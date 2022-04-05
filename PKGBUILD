# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=libkexiv2-git
pkgver=22.03.80.r0.gd8dbd19
pkgrel=1
pkgdesc='A library to manipulate pictures metadata'
arch=('x86_64')
url='https://invent.kde.org/graphics/libkexiv2'
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base' 'exiv2')
makedepends=('git' 'extra-cmake-modules' 'kdoctools')
provides=("libkexiv2=${pkgver%.r*}")
conflicts=('libkexiv2')
groups=('digikamsc-git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$pkgname" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DBUILD_TESTING=OFF \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
}
