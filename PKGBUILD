# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-effects-git
pkgver=r729.bc7c308
pkgrel=1
pkgdesc="Effects plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin"
license=('GPL2')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBEffectsPlugin
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/OpenRGBEffectsPlugin"
    git submodule update --init --recursive
    qmake OpenRGBEffectsPlugin.pro PREFIX=/usr/
    make -j$(nproc)
}

package() {
    cd OpenRGBEffectsPlugin
    make INSTALL_ROOT="$pkgdir" install
}
