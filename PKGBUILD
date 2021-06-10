# Maintainer: Ben <bensongsyz@gmail.com>
pkgname=okular-vim-colemak
_pkgname=okular
pkgver=v21.04.2
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
sha512sums=('7a1eb38d25a448c32c2fc6dc286858935eced38402b611b1c6c618a93b47df469c538d38fac1e2919dbfd2b5fb0771d8d74639793d2cebec8e4d2a9a6ed7fa87')

prepare() {
	cp $_pkgname-$pkgver/part/pageview.cpp ../
	sed "s/Key_J\([^a-zA-Z]\)/Key_N\1/g;
		s/Key_K\([^a-zA-Z]\)/Key_E\1/g;
		s/Key_L\([^a-zA-Z]\)/Key_I\1/g" -i okular-$pkgver/part/pageview.cpp || return 1
}

build() {
	cd "$_pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make -j12
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
} 
