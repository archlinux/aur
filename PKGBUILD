# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-scheduler-next-git
pkgver=0.9.28.g65087a3
pkgrel=1
pkgdesc="Scheduler plugin for OpenRGB (next branch)"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin"
license=('GPL-2.0-only')
depends=('qt6-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-scheduler')
conflicts=('openrgb-plugin-scheduler')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBSchedulerPlugin
    qmake OpenRGBSchedulerPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBSchedulerPlugin"
    git submodule update --init --recursive
    qmake6 OpenRGBSchedulerPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBSchedulerPlugin
    make INSTALL_ROOT="$pkgdir" install
}
