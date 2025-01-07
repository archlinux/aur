# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-sample-git
pkgver=0.9.r0.g4f2aeb3
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
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
