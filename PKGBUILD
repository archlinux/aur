# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=spectacle
pkgname=${_pkgname}-light
pkgver=17.04.3
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
source=("https://download.kde.org/stable/applications/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('1b4792cb908047ea30f780f13ab25c296e6f38718c8cdf005603bb1237a34c76' 'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7'  # Albert Astals Cid <aacid@kde.org>
              'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87') # Christoph Feck <cfeck@kde.org>

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        -DKDEExperimentalPurpose_FOUND=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}

