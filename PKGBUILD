# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=bluejay
pkgver=1.0.1
pkgrel=1
pkgdesc="Bluetooth manager written in Qt"
arch=(x86_64)
url="https://github.com/EbonJaeger/bluejay"
license=(MPL-2.0)
depends=(
    bluez-qt
    kcoreaddons
    kdbusaddons
    ki18n
    kirigami
    kirigami-addons
    qqc2-desktop-style
    qt6-tools
    qt6-declarative
)
makedepends=(
    extra-cmake-modules
    git
    ninja
)
source=(
    "$pkgname-$pkgver::git+$url.git#tag=v$pkgver"
)
b2sums=('b9291ccc2e61dc33928ca2d8c4f0a3bffa01f1a145cb139a40f85db48e98bcd7acede9171135b125c501c11ceccb7ab5ad5427a82e9cabcaf8eed27b94d00330')

build() {
    local cmake_options=(
        -S "$pkgname-$pkgver"
        -B build
        -D CMAKE_BUILD_TYPE=none
        -DCMAKE_INSTALL_PREFIX=/usr
        -G Ninja
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

}
