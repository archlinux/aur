# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgbase=spectacle
pkgname=spectacle-light
pkgver=16.08.3
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
sha256sums=('8b5cfbed8850643f774278b614771df0d27fe5e9eefd28765b76556358c245d5')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake "../${pkgbase}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package_spectacle-light() {
    cd build
    make DESTDIR="${pkgdir}" install
}

