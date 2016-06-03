# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgbase=spectacle
pkgname=spectacle-light
pkgver=16.04.1
pkgrel=1
pkgdesc="KDE screenshot capture utility, without purpose"
arch=(i686 x86_64)
url='https://www.kde.org/applications/graphics/'
license=(GPL)
depends=(xcb-util-cursor libkscreen libkipi kdeclarative)
makedepends=(extra-cmake-modules kdoctools python)
conflicts=(kdegraphics-ksnapshot kscreengenie spectacle)
replaces=(kdegraphics-ksnapshot kscreengenie)
provides=(spectacle)
groups=(kde-applications kdegraphics)
source=("http://download.kde.org/stable/applications/${pkgver}/src/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('e6ddbbb84cefcbe10eda2ff67cd5ade82b9bfe516474e97603c033aed385c3b5')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake "../${pkgbase}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package_spectacle-light() {
    cd build
    make DESTDIR="${pkgdir}" install
}

