# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-http-hook-git
pkgver=0.9.24.g5b6ac57
pkgrel=1
pkgdesc="HTTP Hook plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBHttpHookPlugin"
license=('GPL-2.0-only')
depends=('qt6-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-http-hook')
conflicts=('openrgb-plugin-http-hook')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBHttpHookPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBHttpHookPlugin
    qmake6 OpenRGBHttpHookPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBHttpHookPlugin"
    git submodule update --init --recursive
    qmake6 OpenRGBHttpHookPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBHttpHookPlugin
    make INSTALL_ROOT="$pkgdir" install
}
