# Maintainer: Ben <bensongsyz@gmail.com>
pkgname=okular-vim-colemak
pkgver=v20.12.3
pkgrel=1
pkgdesc="Document Viewer with colemak vim-binding"
arch=('any')
url="https://invent.kde.org/graphics/okular.git"
license=('GPL2')

depends=('djvulibre' 'libspectre' 'libkexiv2' 'poppler-qt5' 'kpty' 'kactivities' 'threadweaver' 'kjs' 'kparts' 'purpose' 'discount' 'phonon-qt5')
optdepends=('ebook-tools' 'kdegraphics-mobipocket' 'libzip' 'khtml' 'chmlib' 'calligra' 'unrar' 'unarchiver')
conflicts=('okular')


makedepends=('unzip' 'extra-cmake-modules' 'appstream' 'kdoctools')
source=("$pkgname-$pkgver.zip::https://invent.kde.org/graphics/okular/-/archive/$pkgver/okular-$pkgver.zip"
        "pageview_colemak.patch")
sha512sums=('21cabe63161e98291ca2de8c9832f9a626fa274cd8159c6aedb90d92ea578861cdb9770458edc347f5d05eebd84d640052ac278c5d6220d0a2042ae5a961e248'
            '90f3ce005333e0656af89be331515cbaea306c89fedd28a3d32d95cffeff79aeb3dc0c7a49bcfbde24d1d66c6dd0fc6295fe60f3aab0c695634639b8c3fb1dbe')

prepare() {
	patch -p0 okular-$pkgver/part/pageview.cpp pageview_colemak.patch
	mkdir build
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
