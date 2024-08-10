# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-hardware-sync-git
pkgver=r112.cf099e1
pkgrel=1
pkgdesc="Hardware Sync plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin"
license=('GPL2')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBHardwareSyncPlugin
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/OpenRGBHardwareSyncPlugin"
    git submodule update --init --recursive
    qmake OpenRGBHardwareSyncPlugin.pro PREFIX=/usr/
    make -j$(nproc)
}

package() {
    cd OpenRGBHardwareSyncPlugin
    make INSTALL_ROOT="$pkgdir" install
}
