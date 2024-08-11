# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-effects-git
pkgver=0.9.r27.g7e6c720
pkgrel=1
pkgdesc="Effects plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb' 'openal')
makedepends=('git')
provides=('openrgb-plugin-effects')
conflicts=('openrgb-plugin-effects')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBEffectsPlugin
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
