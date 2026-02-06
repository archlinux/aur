# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=plasmazones
pkgver=1.6.0
pkgrel=1
pkgdesc='FancyZones-style window tiling for KDE Plasma'
arch=('x86_64')
url='https://github.com/fuddlesworth/PlasmaZones'
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-shadertools'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kdbusaddons'
    'ki18n'
    'kcmutils'
    'kwindowsystem'
    'kglobalaccel'
    'knotifications'
    'kcolorscheme'
    'layer-shell-qt'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-tools'
)
optdepends=(
    'plasma-activities: activity-based layouts'
)
conflicts=('plasmazones-bin' 'plasmazones-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('236a740a72c9594d9fab60879807a07256a26ad64b73e0139b13942cd782f1d4')
install=plasmazones.install

build() {
    cmake -B build -S "PlasmaZones-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
