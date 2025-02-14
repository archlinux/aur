# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=bluejay
pkgver=1.0.2
pkgrel=2
pkgdesc="Bluetooth manager written in Qt"
arch=(x86_64)
url="https://github.com/EbonJaeger/bluejay"
license=(
    CC0-1.0
    CC-BY-SA-4.0
    MPL-2.0
)
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
b2sums=('78abdd4b27b39c496839e1fedb704301ed6f19a4b106ddadb6cfc0c519bb8c61897cb27596c6c3dbf3485a7b3179a81fa7b8ea3d6272a5e50e994b9601ca0d94')

build() {
    local cmake_options=(
        -S "$pkgname-$pkgver"
        -B build
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -G Ninja
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

}
# vim:set ts=4 sw=4 et:
