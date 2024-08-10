# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-visual-map-git
pkgver=r218.0eff188
pkgrel=1
pkgdesc="Visual Map plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin"
license=('GPL2')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBVisualMapPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBVisualMapPlugin
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/OpenRGBVisualMapPlugin"
    git submodule update --init --recursive
    qmake OpenRGBVisualMapPlugin.pro PREFIX=/usr/
    make -j$(nproc)
}

package() {
    cd OpenRGBVisualMapPlugin
    make INSTALL_ROOT="$pkgdir" install
}
