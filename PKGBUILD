# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-sample-git
pkgver=0.9.1.gb979ea1
pkgrel=1
pkgdesc="Sample plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBSamplePlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-sample')
conflicts=('openrgb-plugin-sample')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBSamplePlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBSamplePlugin
    qmake OpenRGBSamplePlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBSamplePlugin"
    git submodule update --init --recursive
    qmake OpenRGBSamplePlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBSamplePlugin
    make INSTALL_ROOT="$pkgdir" install
}
