# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-http-hook-git
pkgver=0.9.8.g349790f
pkgrel=1
pkgdesc="HTTP Hook plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBHttpHookPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-http-hook')
conflicts=('openrgb-plugin-http-hook')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBHttpHookPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBHttpHookPlugin
    qmake OpenRGBHttpHookPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBHttpHookPlugin"
    git submodule update --init --recursive
    qmake OpenRGBHttpHookPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBHttpHookPlugin
    make INSTALL_ROOT="$pkgdir" install
}
