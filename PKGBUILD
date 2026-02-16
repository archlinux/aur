# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=bluejay
pkgver=1.0.3
pkgrel=16
pkgdesc="Bluetooth manager written in Qt"
arch=(x86_64)
url="https://github.com/EbonJaeger/bluejay"
license=(
    'CC0-1.0 AND CC-BY-SA-4.0 AND MPL-2.0'
)
depends=(
    bluez-qt
    glibc
    hicolor-icon-theme
    kcolorscheme
    kcoreaddons
    kdbusaddons
    ki18n
    kirigami
    kirigami-addons
    libstdc++
    qqc2-desktop-style
    qt6-base
    qt6-declarative
    qt6-tools
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
    "CMakeLists.txt.patch"
)
b2sums=('8315db4f7c807a956d7b0c7849cc2ff874332c4506b07d234749a9000ad094e09ad6073037d6acfa440310c1344dd5c362ab5074a84640c39a51d24178e800a2'
        '3791966f4b448c6ca4ea1b2c25179d9350fe8812efed160222f2a84a0617f62e167f0253958f6300f073dd59cbb8a996df6d45ff47e42c854b4344a0ee3c0130')

prepare() {
    patch -d $pkgname-$pkgver -Np1 -i ../CMakeLists.txt.patch
}

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
