# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=bluejay
pkgver=1.0.3
pkgrel=5
pkgdesc="Bluetooth manager written in Qt"
arch=(x86_64)
url="https://github.com/EbonJaeger/bluejay"
license=(
    'CC0-1.0 AND CC-BY-SA-4.0 AND MPL-2.0'
)
depends=(
    bluez-qt
    gcc-libs
    glibc
    hicolor-icon-theme
    kcolorscheme
    kcoreaddons
    kdbusaddons
    ki18n
    kirigami
    kirigami-addons
    qqc2-desktop-style
    qt6-base
    qt6-tools
    qt6-declarative
)
makedepends=(
    appstream
    extra-cmake-modules
    git
    ninja
    vulkan-headers
)
source=(
    "$pkgname-$pkgver::git+$url.git#tag=v$pkgver"
)
b2sums=('8315db4f7c807a956d7b0c7849cc2ff874332c4506b07d234749a9000ad094e09ad6073037d6acfa440310c1344dd5c362ab5074a84640c39a51d24178e800a2')

build() {
    local cmake_options=(
        -S "$pkgname-$pkgver"
        -B build
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -G Ninja
        -W no-dev
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

# vim: set ft=sh ts=4 sw=4 et:
