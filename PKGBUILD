# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-razer-extras-git
pkgver=0.9.3.gd75e929
pkgrel=1
pkgdesc="Razer extras plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBRazerExtrasPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-razer-extras')
conflicts=('openrgb-plugin-razer-extras')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBRazerExtrasPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBRazerExtrasPlugin
    qmake OpenRGBRazerExtrasPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBRazerExtrasPlugin"
    git submodule update --init --recursive
    qmake OpenRGBRazerExtrasPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBRazerExtrasPlugin
    make INSTALL_ROOT="$pkgdir" install
}
