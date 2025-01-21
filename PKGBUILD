# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-e131-receiver-git
pkgver=0.9.9.g3d61f0e
pkgrel=1
pkgdesc="E1.31 Receiver plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBE131ReceiverPlugin"
license=('GPL-2.0-only')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
provides=('openrgb-plugin-e131-receiver')
conflicts=('openrgb-plugin-e131-receiver')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBE131ReceiverPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBE131ReceiverPlugin
    qmake OpenRGBE131ReceiverPlugin.pro 2>&1 | grep VERSION_AUR | cut -d ':' -f 3 | tr -d ' '
}

build() {
    cd "$srcdir/OpenRGBE131ReceiverPlugin"
    git submodule update --init --recursive
    qmake OpenRGBE131ReceiverPlugin.pro PREFIX=/usr/
    make
}

package() {
    cd OpenRGBE131ReceiverPlugin
    make INSTALL_ROOT="$pkgdir" install
}
