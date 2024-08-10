# Maintainer: Adam Honse <calcprogrammer10@gmail.com>
pkgname=openrgb-plugin-e131-receiver-git
pkgver=r57.54f3575
pkgrel=1
pkgdesc="E1.31 Receiver plugin for OpenRGB"
arch=('any')
url="https://gitlab.com/OpenRGBDevelopers/OpenRGBE131ReceiverPlugin"
license=('GPL2')
depends=('qt5-tools' 'openrgb')
makedepends=('git')
source=("git+https://gitlab.com/OpenRGBDevelopers/OpenRGBE131ReceiverPlugin.git")
sha256sums=('SKIP')

pkgver() {
    cd OpenRGBE131ReceiverPlugin
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/OpenRGBE131ReceiverPlugin"
    git submodule update --init --recursive
    qmake OpenRGBE131ReceiverPlugin.pro PREFIX=/usr/
    make -j$(nproc)
}

package() {
    cd OpenRGBE131ReceiverPlugin
    make INSTALL_ROOT="$pkgdir" install
}
