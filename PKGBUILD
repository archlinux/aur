# Maintainer: clmates <clmates at gmail dot com>

pkgname=drivebeacon
pkgver=0.1.2
pkgrel=1
pkgdesc='KDE Plasma system tray interface for the abraunegg OneDrive client'
arch=('x86_64')
url='https://github.com/clmates/drivebeacon'
license=('GPL-3.0-only')
depends=(
    'kcoreaddons'
    'ki18n'
    'kstatusnotifieritem'
    'kxmlgui'
    'onedrive-abraunegg'
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('348899493fb1daeb3e6539990aec6b631f3aefdbce6956c990c17afae730258f')

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
