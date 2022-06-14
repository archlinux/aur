# Maintainer: Ben Song <bensongsyz@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular-vim-colemak
_pkgname=okular
pkgver=22.04.2
pkgrel=1
pkgdesc="Document Viewer with colemak vim-binding"
arch=(x86_64)
url='https://apps.kde.org/okular/'
license=(GPL LGPL FDL)
groups=(kde-applications kde-graphics)
depends=(djvulibre libspectre libkexiv2 poppler-qt5 kpty kactivities threadweaver kjs kparts purpose discount phonon-qt5)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml chmlib)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support' 'libzip: CHM support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support'
            'unrar: Comic Book Archive support' 'unarchiver: Comic Book Archive support (alternative)')
conflicts=('okular')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz)
sha256sums=('c9a1dd06bcd3045e9c5a9f4cca83e4372587c9f716ee34880045be1d91a8ecb8')

options=(debug !zipman)

prepare() {
    cp $_pkgname-$pkgver/part/pageview.cpp ../
    sed "s/Key_J\([^a-zA-Z]\)/Key_N\1/g;
	s/Key_K\([^a-zA-Z]\)/Key_E\1/g;
	s/Key_L\([^a-zA-Z]\)/Key_I\1/g" -i okular-$pkgver/part/pageview.cpp || return 1
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
