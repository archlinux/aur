# Maintainer: clmates <clmates at gmail dot com>

pkgname=drivebeacon
pkgver=1.0.8
pkgrel=1
pkgdesc='KDE Plasma client and service for Microsoft Graph OneDrive synchronization'
arch=('x86_64')
url='https://github.com/clmates/drivebeacon'
license=('GPL-3.0-only')
depends=(
    'kcoreaddons'
    'ki18n'
    'kio'
    'kstatusnotifieritem'
    'kxmlgui'
    'fuse3'
    'kwallet'
    'qt6-base'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'gettext'
    'ninja'
)
checkdepends=(
    'appstream'
    'desktop-file-utils'
)
optdepends=(
    'dolphin: Dolphin actions and item state overlays'
    'onedrive-abraunegg: optional legacy backend and migration support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('269c7edfe893bbde3f2e8305373cb104162b3fff38af7c90927d066cb2d1528c')

build() {
    cmake -S "$srcdir/$pkgname-$pkgver" -B build -G Ninja \
        -DBUILD_TESTING=ON \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
