# Maintainer: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=r456.01e0808
pkgrel=1
pkgdesc='Configuration utility for RGB lights supporting motherboards, RAM, & peripherals'
arch=('x86_64')
url='https://gitlab.com/CalcProgrammer1/OpenRGB'
license=('GPL2')
depends=('qt5-base' 'libusb' 'hidapi')
optdepends=('')
makedepends=('git' 'make')
conflicts=('openrgb')
provides=('openrgb')
source=("openrgb::git+https://gitlab.com/CalcProgrammer1/openrgb.git"
        'openrgb.desktop'
        '99-openrgb.rules')
sha256sums=('SKIP'
            '383a2c64c1fd353d6ae07ce19740887a66e0acafa096cab263858eb279468f42'
            '5b1c8be74ff77e2165cfb60b44f0256b3a4f7916eec49b4f641d8db3dbde29fa')

pkgver() {
    cd openrgb
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/openrgb"
    qmake OpenRGB.pro
    make -j$(($(nproc)+1))
}

package() {
    cd "$srcdir/openrgb"
    install -Dm755 OpenRGB "$pkgdir"/usr/bin/openrgb
    install -Dm644 qt/OpenRGB.png "$pkgdir"/usr/share/pixmaps/openrgb.png
    install -Dm644 -t "$pkgdir"/usr/share/applications ../openrgb.desktop
    install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d ../99-openrgb.rules
}
