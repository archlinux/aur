# Maintainer: Ben <bensongsyz@gmail.com>
pkgname=okular-vim-colemak
pkgver=v20.12.2
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
sha512sums=('c12167bb391bc0372a94b986aad9b50429a9658cdb41ea5d923a63dfaca27d5ae6608c9569e0ecdf0595f3fe945dfa967f585a68dde06815906799e49cffd1e9'
            '90f3ce005333e0656af89be331515cbaea306c89fedd28a3d32d95cffeff79aeb3dc0c7a49bcfbde24d1d66c6dd0fc6295fe60f3aab0c695634639b8c3fb1dbe')

# 三个函数的位置都是$src-dir
prepare() {
#unzip $pkgname-$pkgver.zip
# 自动解压了
#	echo ================================
#mv okular-$pkgver $pkgname-$pkgver
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
