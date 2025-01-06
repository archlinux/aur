# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-http-hook-git
pkgver=0.9.r6.g4421904
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
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
