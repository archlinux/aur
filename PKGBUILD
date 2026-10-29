# Maintainer: Lordbooker <lordbooker@gmail.com>
#
# SPDX-FileCopyrightText: 2026 Lordbooker
# SPDX-License-Identifier: GPL-2.0-only
#
# The release workflow sets pkgver and sha256sums from the tag and publishes
# this file to the AUR (package gkey-config).

pkgname=gkey-config
pkgver=1.6.0
pkgrel=1
pkgdesc="Configuration tool for the gaming keys of Logitech G keyboards (hid-lg-g15)"
arch=('x86_64')
url="https://github.com/Lordbooker/gkey-config"
license=('GPL-2.0-only')
depends=('qt6-base' 'libevdev' 'systemd-libs' 'systemd')
makedepends=('cmake' 'qt6-tools')
optdepends=('polkit: allow LED control from the configuration tool'
            'qt6-wayland: native Wayland support'
            'xdg-utils: open the profile and macro folders'
            'qt6-translations: translated standard buttons in the configuration tool')
conflicts=('linux-g13-driver' 'linux-g13-driver-git')
install=gkey-config.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('38b315d9494e29680e7947566e768f4dbfc1807ac77872e2ddfa8ed5bd7db499')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DGKEY_VERSION="$pkgver"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
