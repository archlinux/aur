# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-fan-sync-git
pkgver=0.9.r6.g4983f10
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
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
