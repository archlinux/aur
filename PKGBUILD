# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-visual-map-next-git
pkgver=1.0rc2.r7.g84accb0
pkgrel=1
pkgdesc="Visual Map plugin for OpenRGB (next branch)"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin"
license=('GPL-2.0-only')
depends=('qt6-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-visual-map')
conflicts=('openrgb-plugin-visual-map')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBVisualMapPlugin
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
