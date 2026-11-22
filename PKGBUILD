# Maintainer: clmates <clmates at gmail dot com>

pkgname=drivebeacon
pkgver=1.0.17
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
sha256sums=('63316e433b1aa3c0470dbc41644212d59243ef18004ee37894fc88265429fde3')

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
