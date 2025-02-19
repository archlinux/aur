# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-effects-git
pkgver=0.9.70.g4b11017
pkgrel=1
pkgdesc="Effects plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb' 'openal' 'libpipewire')
makedepends=('git')
provides=('openrgb-plugin-effects')
conflicts=('openrgb-plugin-effects')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBEffectsPlugin
    qmake OpenRGBEffectsPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBEffectsPlugin"
    git submodule update --init --recursive
    qmake OpenRGBEffectsPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBEffectsPlugin
    make INSTALL_ROOT="$pkgdir" install
}
