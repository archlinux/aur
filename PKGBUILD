# Maintainer: Bruno Pagani <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=okular
pkgname=${_pkgname}-light
pkgver=17.04.0
pkgrel=1
pkgdesc='KDE document viewer, without Mobi/ePub/CHM and Text-to-Speech'
arch=('i686' 'x86_64')
url="https://kde.org/applications/graphics/okular/"
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdegraphics')
depends=('djvulibre' 'libspectre' 'libkexiv2' 'poppler-qt5' 'qca-qt5' 'kpty' 'kactivities' 'threadweaver' 'kjs' 'kparts')
makedepends=('extra-cmake-modules' 'kdoctools' 'python') #ebook-tools kdegraphics-mobipocket khtml chmlib
#optdepends=('ebook-tools: mobi and epub support'
#            'kdegraphics-mobipocket: mobi support'
#            'khtml: CHM support'
#            'chmlib: CHM support'
#            'calligra: ODT and ODP support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://download.kde.org/stable/applications/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('e4a817e276ea7e003b2f494514bcb53343398376d92ad03a5dc0fedf23759803' 'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # Albert Astals Cid <aacid@kde.org>

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        -DQt5TextToSpeech_FOUND=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
