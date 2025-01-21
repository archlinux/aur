# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-skin-git
pkgver=0.9.7.g20aeaf0
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
    qmake OpenRGBSkinPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
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
