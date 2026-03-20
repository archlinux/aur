# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Requires Plasma 6.6+ (KF6 6.6, Qt 6.6, LayerShellQt 6.6, KWin 6.6).

pkgname=plasmazones
pkgver=2.3.9
pkgrel=1
pkgdesc='Window tiling and autotiling for KDE Plasma'
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
    'ninja'
    'qt6-tools'
    'kwin'
)
optdepends=(
    'plasma-activities: activity-based layouts'
)
conflicts=('plasmazones-bin' 'plasmazones-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff0d69699c43d7f038510d63e466b8fe0c747c6d1b664394d8ab69b599d49e98')
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
