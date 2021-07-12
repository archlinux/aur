# Maintainer: Ben <bensongsyz@gmail.com>
pkgname=okular-vim-colemak
_pkgname=okular
pkgver=v21.04.3
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
sha512sums=('a378a0c3e4d390b6270e31bf84a161e325874e04c4adafacfe4cc65f5898bde85fe727cfbaaa70671fc54c52b508beccad0b6e3de04c98ade75c63896e7b7e30')

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
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
} 
