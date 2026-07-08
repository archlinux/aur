# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-effects-next-git
pkgver=0.9.115.gf9dc731
pkgrel=1
pkgdesc="Effects plugin for OpenRGB (next branch)"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin"
license=('GPL-2.0-only')
depends=('qt6-tools' 'openrgb' 'openal')
makedepends=('git')
provides=('openrgb-plugin-effects')
conflicts=('openrgb-plugin-effects')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBEffectsPlugin
    qmake6 OpenRGBEffectsPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBEffectsPlugin"
    git submodule update --init --recursive
    qmake6 OpenRGBEffectsPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBEffectsPlugin
    make INSTALL_ROOT="$pkgdir" install
}
