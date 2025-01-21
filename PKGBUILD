# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-hardware-sync-git
pkgver=0.9.8.g0b543c4
pkgrel=1
pkgdesc="Hardware Sync plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb' 'libgtop')
makedepends=('git')
provides=('openrgb-plugin-hardware-sync')
conflicts=('openrgb-plugin-hardware-sync')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBHardwareSyncPlugin
    qmake OpenRGBHardwareSyncPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBHardwareSyncPlugin"
    git submodule update --init --recursive
    qmake OpenRGBHardwareSyncPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBHardwareSyncPlugin
    make INSTALL_ROOT="$pkgdir" install
}
