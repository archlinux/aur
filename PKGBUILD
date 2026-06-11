# Maintainer: strandzen <strandzen@gmail.com>
pkgname=appimage-manager-plasma
pkgver=2.0.1
pkgrel=1
pkgdesc="A lightweight KDE Plasma utility for installing, managing, and removing AppImage files"
arch=('x86_64' 'aarch64')
url="https://github.com/strandzen/AppImage-Manager"
license=('GPL-2.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'kirigami'
    'kirigami-addons'
    'kcoreaddons'
    'ki18n'
    'kconfig'
    'kio'
    'kiconthemes'
    'knotifications'
    'kcrash'
    'kdbusaddons'
    'kstatusnotifieritem'
    'libappimage'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'ninja'
    'qt6-tools'
)
optdepends=(
    'am-git: install AppImages via the AM package manager'
    'zsync2: delta updates (falls back to full download without it)'
    'libcanberra: completion sound notifications'
)
provides=('appimagemanager')
source=("$pkgname-$pkgver.tar.gz::https://github.com/strandzen/AppImage-Manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b31f19b46b6bcc86f211c7e6f786c967dcc39706f169714a78eabf3ae015d956')

build() {
    cmake \
        -B build \
        -S "AppImage-Manager-$pkgver" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
