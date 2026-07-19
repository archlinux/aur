# Maintainer: clmates <clmates at gmail dot com>

pkgname=drivebeacon
pkgver=0.1.0
pkgrel=1
pkgdesc='KDE Plasma system tray interface for the abraunegg OneDrive client'
arch=('x86_64')
url='https://github.com/clmates/drivebeacon'
license=('GPL-3.0-only')
depends=(
    'kcoreaddons'
    'ki18n'
    'kirigami'
    'kstatusnotifieritem'
    'kxmlgui'
    'onedrive-abraunegg'
    'qt6-base'
    'qt6-declarative'
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5db44367eb980f8480df57766c849061235f4c060a3cfcea322a7d2551d7dda')

build() {
    cmake -S "$pkgname-$pkgver" -B build -G Ninja \
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
