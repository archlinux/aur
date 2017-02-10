# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=spectacle
pkgname=${_pkgname}-light
pkgver=16.12.2
pkgrel=1
pkgdesc="KDE screenshot capture utility, without purpose"
arch=('i686' 'x86_64')
url="https://www.kde.org/applications/graphics/"
license=('GPL')
depends=('xcb-util-cursor' 'libkipi' 'kdeclarative')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=('kde-applications' 'kdegraphics')
source=("http://download.kde.org/stable/applications/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('07145215ae6824ddc10c5aceb76a7533ab0ada585c256f945b4c546edf44dfea' 'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # Albert Astals Cid <aacid@kde.org>

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDEExperimentalPurpose_FOUND=OFF \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}

