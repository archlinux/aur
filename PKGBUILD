# Maintainer: clmates <clmates at gmail dot com>

pkgname=drivebeacon
pkgver=0.1.1.r1.g749422e
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
source=('git+https://github.com/clmates/drivebeacon.git#commit=749422ec0e45488879a5acdc53557fe5d7b11f0d')
sha256sums=('SKIP')

build() {
    cmake -S "$srcdir/drivebeacon" -B build -G Ninja \
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
