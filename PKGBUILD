# Maintainer: Myrddin Wyllt <darknesseatsall at aim dot com>

pkgname=openrgb-git
pkgver=r426.1e171fc
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
            '4cfa7e03450ff79d98b382e8fd82cf697f0a9d1180566f3287c35c6841bb5464'
            'f2d94763f5c61689a99e73e65178bb7de8561dd2c163f41b293fde1755c521d3')

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
