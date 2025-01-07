# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-scheduler-git
pkgver=0.9.r8.g395bf51
pkgrel=1
pkgdesc="Scheduler plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-scheduler')
conflicts=('openrgb-plugin-scheduler')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBSchedulerPlugin
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/OpenRGBSchedulerPlugin"
    git submodule update --init --recursive
    qmake OpenRGBSchedulerPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBSchedulerPlugin
    make INSTALL_ROOT="$pkgdir" install
}
