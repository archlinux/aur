# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-skin-git
pkgver=0.9.r6.g882dc49
pkgrel=1
pkgdesc="Skin plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBSkinPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-skin')
conflicts=('openrgb-plugin-skin')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBSkinPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBSkinPlugin
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/OpenRGBSkinPlugin"
    git submodule update --init --recursive
    qmake OpenRGBSkinPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBSkinPlugin
    make INSTALL_ROOT="$pkgdir" install
}
