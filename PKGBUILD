# Maintainer: Lordbooker <lordbooker@gmail.com>
#
# The release workflow sets pkgver and sha256sums from the tag and publishes
# this file to the AUR (package gkey-config).

pkgname=gkey-config
pkgver=1.0.0
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
sha256sums=('c9d8cbf344ac191578970b9c655da38af000125b266b0fcba763b4766799c97c')

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
