# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgbase=spectacle
pkgname=spectacle-light-old
pkgver=16.12.0
pkgrel=1
pkgdesc="KDE screenshot capture utility, without purpose"
arch=('i686' 'x86_64')
url="https://www.kde.org/applications/graphics/"
license=('GPL')
depends=('xcb-util-cursor' 'libkipi' 'kdeclarative')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
provides=('spectacle')
conflicts=('kdegraphics-ksnapshot' 'kscreengenie' 'spectacle')
replaces=('kdegraphics-ksnapshot' 'kscreengenie')
groups=('kde-applications' 'kdegraphics')
source=("http://download.kde.org/stable/applications/${pkgver}/src/${pkgbase}-${pkgver}.tar.xz"{,.sig})
sha256sums=('31d4b00da13c9cc68b2d8f3c4633cba8e4ba82f819d3edac87aecd4fa70f31b3' 'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7') # Albert Astals Cid <aacid@kde.org>

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake "../${pkgbase}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDEExperimentalPurpose_FOUND=OFF \
        -DBUILD_TESTING=OFF
    make
}

package_spectacle-light-old() {
    cd build
    make DESTDIR="${pkgdir}" install
}

