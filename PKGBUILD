# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=spectacle
pkgname=${_pkgname}-light
pkgver=17.08.1
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
source=("https://download.kde.org/stable/applications/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz")

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

sha256sums=('294b92f528a147993ba735dcfaebe1ec68fecaf605d19900a160fe244c0ca01f')
