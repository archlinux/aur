# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-fan-sync-git
pkgver=0.9.7.g7e1d5c8
pkgrel=1
pkgdesc="Fan sync plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBFanSyncPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-fan-sync')
conflicts=('openrgb-plugin-fan-sync')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBFanSyncPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBFanSyncPlugin
    qmake OpenRGBFanSyncPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBFanSyncPlugin"
    git submodule update --init --recursive
    qmake OpenRGBFanSyncPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBFanSyncPlugin
    make INSTALL_ROOT="$pkgdir" install
}
