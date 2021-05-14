# Maintainer: Ben <bensongsyz@gmail.com>
pkgname=okular-vim-colemak
pkgver=v21.04.1
pkgrel=1
pkgdesc="Document Viewer with colemak vim-binding"
arch=('any')
url="https://invent.kde.org/graphics/okular.git"
license=('GPL2')

depends=('djvulibre' 'libspectre' 'libkexiv2' 'poppler-qt5' 'kpty' 'kactivities' 'threadweaver' 'kjs' 'kparts' 'purpose' 'discount' 'phonon-qt5')
optdepends=('ebook-tools' 'kdegraphics-mobipocket' 'libzip' 'khtml' 'chmlib' 'calligra' 'unrar' 'unarchiver')
conflicts=('okular')


makedepends=('unzip' 'extra-cmake-modules' 'appstream' 'kdoctools')
source=("$pkgname-$pkgver.zip::https://invent.kde.org/graphics/okular/-/archive/$pkgver/okular-$pkgver.zip")
sha512sums=('cb9f00fbc9f0b2425958f73479e25f0a65b5ddf97bf61fd7ea92b6702a4c3175c29e97f02e87ec1a22fec644b9d9bbea10964cf0bea9cea0fe66254346f2e758')

prepare() {
	cp okular-$pkgver/part/pageview.cpp ../
	sed "s/Key_J\([^a-zA-Z]\)/Key_N\1/g;
		s/Key_K\([^a-zA-Z]\)/Key_E\1/g;
		s/Key_L\([^a-zA-Z]\)/Key_I\1/g" -i okular-$pkgver/part/pageview.cpp
	[ -d build ] || mkdir build
}

build() {
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../okular-$pkgver
	make -j12
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
} 
