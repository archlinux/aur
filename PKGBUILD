# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-visual-map-git
pkgver=0.9.34.g84accb0
pkgrel=1
pkgdesc="Visual Map plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin"
license=('GPL-2.0-only')
depends=('qt6-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-visual-map')
conflicts=('openrgb-plugin-visual-map')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBVisualMapPlugin
    qmake6 OpenRGBVisualMapPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBVisualMapPlugin"
    git submodule update --init --recursive
    qmake6 OpenRGBVisualMapPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBVisualMapPlugin
    make INSTALL_ROOT="$pkgdir" install
}
